wall = 2;
tol = 0.6;

w_tube = 50;
l_tube = 30;

w = w_tube + wall * 2 + tol;
l = l_tube + wall * 2 + tol;
d = 70 - tol;

N_points = 100;
N_slices = 100;

h = 75;

rot = 0;

beta = 0.1;

function alpha_fun( x ) = beta * x * x + ( 1 - beta ) * x;

function circle_point( theta ) = ( d / 2 ) * [ cos( theta ), sin( theta ) ];

function square_point( theta ) = 
    theta < 1 * 45 ? [ w / 2, ( l / 2 ) * tan( theta ) ] :
    theta < 3 * 45 ? [ ( w / 2 ) * tan( 90 - theta ), l / 2 ] :
    theta < 5 * 45 ? [ -w / 2, ( l / 2 ) * tan( 180 - theta ) ] :
    theta < 7 * 45 ? [ ( w / 2 ) * tan( theta - 270 ), -l / 2 ] :
                     [ w / 2, ( l / 2 ) * tan( theta ) ];

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
        for( i = [ 1 : N_slices - 1 ] ){
            rotate( rot * ( i - 1 ) / ( N_slices - 1 ), [ 0, 0, 1 ] )
                hull(){
                    translate( [ 0, 0, ( i - 1 ) * h / N_slices ] )
                        morph(
                            alpha_fun( ( i - 1 ) / ( N_slices - 1 ) ),
                            h / N_slices 
                        );
                    translate( [ 0, 0, i * h / N_slices ] )
                        morph(
                            alpha_fun( i / ( N_slices - 1 ) ),
                            h / N_slices 
                        );
                }
        }        
    }
}

difference() {
    shape();
    
    translate( [ 0, 0, h / 2 ] )
        cube( [ w_tube + tol, l_tube + tol, h + 2 ], center = true );
    
    translate( [ 0, 0, h - 40 + 1e-2 ] )
        cylinder( h = 40, d2 = d, d1 = d / 2, $fn = N_points );
}
