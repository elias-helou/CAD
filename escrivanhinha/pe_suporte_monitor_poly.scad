mdf_h = 15;

h = 150 - 15;

w = 25;
l = 25;

w_conexao = 60;
l_conexao = 60;

d = 50;

rot = 90;

beta = 0.1;

N_slices_pilar = ceil( h / 2 );
N_points = 64;

hole_d = 4;
hole_dist = 7;

//function alpha_fun( x ) = beta * x * x + ( 1 - beta ) * x;
function aux( x ) = sin( 180 + 180 * x );
function alpha_fun( x ) = 1 - pow( abs( aux( x ) ), 1.5 );
//function alpha_fun( x ) = 0;

function circle_point( theta ) = ( d / 2 ) * [ cos( theta ), sin( theta ) ];

function rotate_vec( v, theta ) =
    [
        -v[ 0 ] * sin( theta ) + v[ 1 ] * cos( theta ),
         v[ 0 ] * cos( theta ) + v[ 1 ] * sin( theta )
    ];

function square_point( theta ) = 
    theta % 360 < 1 * 45 ? [ w / 2, ( l / 2 ) * tan( theta ) ] :
    theta % 360 < 3 * 45 ? [ ( w / 2 ) * tan( 90 - theta ), l / 2 ] :
    theta % 360 < 5 * 45 ? [ -w / 2, ( l / 2 ) * tan( 180 - theta ) ] :
    theta % 360 < 7 * 45 ? [ ( w / 2 ) * tan( theta - 270 ), -l / 2 ] :
                     [ w / 2, ( l / 2 ) * tan( theta ) ];
                     
function points() =
    
    [
        for( j = [ 0 : N_slices_pilar ] )
            for( i = [ 0 : N_points - 1 ] )
                    concat(
                        rotate_vec( alpha_fun( j / N_slices_pilar ) * circle_point( 360 / N_points * i ), rot / N_slices_pilar * j ) +
                        rotate_vec( ( 1 - alpha_fun( j / N_slices_pilar ) ) * square_point( 360 / N_points * i ), rot / N_slices_pilar * j ),
                        j * h / N_slices_pilar
                    )
    ];
            
function faces() = 
            
    [
            // Top face:
            [
                for( i = [ 0 : N_points - 1 ] )
                    ( N_slices_pilar + 1 ) * N_points - 1 - i
            ],
            // Bottom face:
            [
                for( i = [ 0 : N_points - 1 ] )
                    i
            ],
            for( j = [ 0 : N_slices_pilar - 1 ] )
                for( i = [ 0 : N_points - 1 ] )
                    [
                        j * N_points + N_points - 1 - i,
                        j * N_points + N_points - 1 - ( ( i + 1 ) % N_points ),
                        ( j + 1 ) * N_points + N_points - 1 - ( ( i + 1 ) % N_points ),
                        ( j + 1 ) * N_points + N_points - 1 - i 
                    ]
    ];

module morph( alpha, h ) {
    
    linear_extrude ( h ) {
        polygon(
            [
                for( i = [ 1 : N_points ] )
                    alpha * circle_point( 360 / N_points * ( i - 1 ) ) +
                    ( 1 - alpha ) * square_point( 360 / N_points * ( i - 1 ) )
            ]
        );
    }    
}

module shape() {
    union(){                
        for( i = [ 1 : N_slices_pilar ] ){
            rotate( rot * ( i - 1 ) / ( N_slices_pilar - 1 ), [ 0, 0, 1 ] )
                translate( [ 0, 0, ( i - 1 ) * h / N_slices_pilar ] )
                    morph(
                        alpha_fun( ( i - 1 ) / ( N_slices_pilar - 1 ) ),
                        h / N_slices_pilar 
                    );
        }        
    }
}

render( convexity = 10 ){

    difference() {
        union() {
            polyhedron( points(), faces = faces(), convexity = 10 );
    
            translate( [ -w_conexao / 2, -l_conexao / 2, 0 ] )
                cube( [ w_conexao, l_conexao, 5 ] );
        }
        
        translate( [ w_conexao / 2 - hole_dist, l_conexao / 2 - hole_dist, -1 ] )
            cylinder( d = hole_d, h = 100, $fn = N_points );
        translate( [ -w_conexao / 2 + hole_dist, l_conexao / 2 - hole_dist, -1 ] )
            cylinder( d = hole_d, h = 100, $fn = N_points );
        translate( [ -w_conexao / 2 + hole_dist, -l_conexao / 2 + hole_dist, -1 ] )
            cylinder( d = hole_d, h = 100, $fn = N_points );
        translate( [ w_conexao / 2 - hole_dist, -l_conexao / 2 + hole_dist, -1 ] )
            cylinder( d = hole_d, h = 100, $fn = N_points );
    }
}