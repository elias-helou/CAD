module metalon( perf, l, angle1 = 0, angle2 = 0 ) {
    
    cube( [ perf[ 0 ], perf[ 1 ], l ] );
    
}

l = 700;
w = 500;
h = 300;

h_lat = 40;
w_lat = 40;

h_diag = 50;
w_diag = 30;

h_travessa = 30;
w_travessa = 50;

w_tampo = 15;

L = sqrt( w * w + pow( h - 2 * h_lat, 2 ) );
L_tilde = sqrt( L * L - h_diag * h_diag );
angle_diag = atan( w / ( h - 2 * h_lat ) ) - atan( h_diag / L_tilde );
//angle_diag = atan( h / w );

color( [ 0.3, 0.3, 0.3 ] ) rotate( 0, [ 1, 0, 0 ] ) { 
    
    metalon( [ w_lat, h_lat ], w );
    translate( [ l - w_lat, 0, 0 ] )
        metalon( [ w_lat, h_lat ], w );
    
    translate( [ 0, h_lat - h, 0 ] ){
        metalon( [ w_lat, h_lat ], w );
        translate( [ l - w_lat, 0, 0 ] )
            metalon( [ w_lat, h_lat ], w );
    }
    
    difference(){
        union(){
            rotate( 90 - angle_diag, [ 1, 0, 0 ] )
                metalon( [ w_diag, h_diag ], L_tilde );
            translate( [ l - w_diag, 0, 0 ] )
                rotate( 90 - angle_diag, [ 1, 0, 0 ] )
                    metalon( [ w_diag, h_diag ], L_tilde );
        }
        
        translate( [ -1, h_lat, -1 ] )
            cube( [ 1e5, 1e5, 1e5 ] );
        translate( [ -1, -100 - h + h_lat, -1 ] )
            cube( [ 1e5, 100, 1e5 ] );
    }
    
    translate( [ w_lat, h_lat - h_travessa, w - w_tampo ] )
        rotate( 90, [ 0, 1, 0 ] )
            metalon( [ w_travessa, h_travessa ], l - 2 * w_lat );
    translate( [ w_lat, -h + h_lat, w - w_tampo ] )
        rotate( 90, [ 0, 1, 0 ] )
            metalon( [ w_travessa, h_travessa ], l - 2 * w_lat );
//    translate( [ 0, h_lat, w - w_tampo - w_travessa ] )
//        rotate( 90, [ 1, 0, 0 ] )
//            metalon( [ w_travessa, h_travessa ], h - 2 * w_travessa );
}

translate( [ w_lat + 1, -h + h_lat, w - w_tampo ] )
    color( [ 1, 1, 1 ] )
        cube( [ l - 2 * w_lat - 2, h, w_tampo ] );

echo( "Comprimento metalon diagonal: ", L_tilde );
echo( "Ângulo metalon diagonal: ", angle_diag );