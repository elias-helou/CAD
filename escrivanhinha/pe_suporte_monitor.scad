mdf_h = 15;

h = 150 - 15;

w = 25;
l = 25;

w_conexao = 60;
l_conexao = 60;

d = 50;

rot = 90;

beta = 0.1;

N_slices_pilar = h * 10;
N_points = 48;

hole_d = 4;
hole_dist = 7;

//function alpha_fun( x ) = beta * x * x + ( 1 - beta ) * x;
function aux( x ) = sin( 180 + 180 * x );
function alpha_fun( x ) = 1 - pow( abs( aux( x ) ), 1.5 );

function circle_point( theta ) = ( d / 2 ) * [ cos( theta ), sin( theta ) ];

function square_point( theta ) = 
    theta < 1 * 45 ? [ w / 2, ( l / 2 ) * tan( theta ) ] :
    theta < 3 * 45 ? [ ( w / 2 ) * tan( 90 - theta ), l / 2 ] :
    theta < 5 * 45 ? [ -w / 2, ( l / 2 ) * tan( 180 - theta ) ] :
    theta < 7 * 45 ? [ ( w / 2 ) * tan( theta - 270 ), -l / 2 ] :
                     [ w / 2, ( l / 2 ) * tan( theta ) ];

module morph( alpha, h ) {
    
    linear_extrude ( h, twist = -rot / ( N_slices_pilar - 1 ) ) {
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

difference() {
    union() {
        shape();
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