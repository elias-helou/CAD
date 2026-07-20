s = 1.6 * 0.75;

// Resolution parameters:
$fn = 50;
N_1 = 101;
N_fore = 31;
N_rear = 31;

// Hull width:
W_1 = 30 * s;
w_1 = W_1 / 2;
// Hull height:
H_1 = 50 * s;

// Main body length
l_1 = 180 * s;

// "sharpness" parameter for straight line:
function sharp( h, w ) = h / w;

// Main body "sharpness" parameter:
b_1 = 0.25 * sharp( H_1, w_1 );
//b_1 = sharp( H, w );

a_1 = ( -H_1 + b_1 * w_1 ) / ( w_1 * w_1 );

// Shape function:
function X_main( n, w, W, N ) = -w + ( n - 1 ) / ( N - 1 ) * W;
function pt_main( n, w, W, N, a, b, c ) = ( X_main( n, w, W, N ) <= 0 ) ? [ [ X_main( n, w, W, N ), a * X_main( n, w, W, N ) * X_main( n, w, W, N ) + b * X_main( n, w, W, N ) + c ] ] : [ [ X_main( n, w, W, N ), a * X_main( n, w, W, N ) * X_main( n, w, W, N ) - b * X_main( n, w, W, N ) + c ] ];
function poly( n, w, W, N, a, b, c ) = ( n == 1 ) ? pt_main( n, w, W, N, a, b, c ) : concat( poly( n - 1, w, W, N, a, b, c ), pt_main( n, w, W, N, a, b, c ) );

// Forefront length:
l_2 = 40 * s;
// Forefront "sharpness" parameter:
// the "width" here is 1, the normal scale.
b_2 = 0.5 * sharp( l_2, 1 );
a_2 = -l_2 + b_2;

// Forefront scale function:
function Y_fore( n ) = ( n - 1 ) / ( N_fore - 1 ) * l_2;
function X_fore( n ) = ( a_2 == 0 ) ? ( Y_fore( n ) - l_2 ) / b_2 : ( -b_2 + sqrt( b_2 * b_2 - 4 * a_2 * ( l_2 - Y_fore( n ) ) ) ) / ( 2 * a_2 );
function S_fore( n ) = a_2 * X_fore( n ) * X_fore( n ) + b_2 * X_fore( n ) + l_2;

// Rear length:
l_3 = 20 * s;
// Rear "sharpness" parameter:
// the "width" here is 1, the normal scale.
b_3 = 0.0 * sharp( l_3, 1 );
a_3 = -l_3 + b_3;

// Rear scale function:
function Y_rear( n ) = ( n - 1 ) / ( N_rear - 1 ) * l_2;
function X_rear( n ) = ( a_2 == 0 ) ? ( Y_rear( n ) - l_3 ) / b_3 : ( -b_3 + sqrt( b_3 * b_3 - 4 * a_3 * ( l_3 - Y_rear( n ) ) ) ) / ( 2 * a_3 );

module casco(){
// Main body:
    linear_extrude( height = l_1 )
        polygon( points = poly( N_1, w_1, W_1, N_1, a_1, b_1, H_1 ) );

    // Rear:
    for ( i = [ 1 : N_fore ] ) {
        translate( [ 0, 0, -( i - 1 ) / N_fore * l_2 ] )
            scale( [ -X_fore( i ), -X_fore( i ), -1 ] )
                linear_extrude( height = l_2 / N_fore, scale = X_fore( i + 1 ) / X_fore( i ) )
                    polygon( points = poly( N_1, w_1, W_1, N_1, a_1, b_1, H_1 ) );
    }


    // Front:
    for ( i = [ 1 : N_rear ] ) {
        translate( [ 0, 0, ( i - 1 ) / N_rear * l_3 + l_1 ] )
            scale( [ -X_rear( i ), -X_rear( i ), 1 ] )
                linear_extrude( height = l_3 / N_rear, scale = X_rear( i + 1 ) / X_rear( i ) )
                    polygon( points = poly( N_1, w_1, W_1, N_1, a_1, b_1, H_1 ) );
    }
}

hole_h = 32;
hole_r = ( 3 + 0.48 ) / 2;
difference() {
    casco();

    translate( [ -500, -1, ( l_1 - l_2 + l_3 ) / 2 ] )
    // Comente o espelhamento para obter a frente:
//        mirror( [ 0, 0, 1 ] )
            cube( [ 1000, 1000, 1000 ] );

    translate( [ 0, 0.75 * H_1, ( l_1 - l_2 + l_3 - hole_h ) / 2 ] )
        cylinder( r = hole_r, h = hole_h, $fn = 50 );
    translate( [ -0.5 * w_1, 0.15 * H_1, ( l_1 - l_2 + l_3 - hole_h ) / 2 ] )
        cylinder( r = hole_r, h = hole_h, $fn = 50 );
    translate( [  0.5 * w_1, 0.15 * H_1, ( l_1 - l_2 + l_3 - hole_h ) / 2 ] )
        cylinder( r = hole_r, h = hole_h, $fn = 50 );
}

echo( l_1 + l_2 + l_3 );