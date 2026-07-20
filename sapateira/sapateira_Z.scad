module metalon( perf, l, angle1 = 0, angle2 = 0 ) {
    
    cube( [ perf[ 0 ], perf[ 1 ], l ] );
    
}

horizontais = true;

l = 700;
w = 300;
h = 460;

h_lat = 40;
w_lat = 40;

h_diag = 50;
w_diag = 30;

h_travessa = 25;
w_travessa = 25;

h_travessinha = 15;
w_travessinha = 15;

w_tampo = 15;

L = sqrt( w * w + pow( h - 2 * h_lat, 2 ) );
L_tilde = sqrt( L * L - h_diag * h_diag );
angle_diag = atan( w / ( h - 2 * h_lat ) ) - atan( h_diag / L_tilde );

echo( "Comprimento do metal diagonal: ", L_tilde );
echo( "Ângulo do metal diagonal: ", angle_diag );

cor_metal = [ 0.3, 0.3, 0.3 ];
cor_tampo = [ 1.0, 1.0, 1.0 ];

color( cor_metal ) { 
    
    // Laterais horizontais:
    translate( [ 0, 0, -h_lat ] ){
        rotate( 90, [ 1, 0, 0 ] )
            metalon( [ w_lat, h_lat ], w );
        translate( [ l - w_lat, 0, 0 ] )
            rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_lat, h_lat ], w );
        
        translate( [ 0, 0, h - h_lat ] ){
            rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_lat, h_lat ], w );
            translate( [ l - w_lat, 0, 0 ] )
                rotate( 90, [ 1, 0, 0 ] )
                    metalon( [ w_lat, h_lat ], w );
        }
    }

    // Laterais diagonais:
    rotate( angle_diag, [ 1, 0, 0 ] )
        translate( [ w_lat - w_diag, -h_diag, 0 ] )
            metalon( [ w_diag, h_diag ], L_tilde );
    translate( [ l - w_lat, 0, 0 ] )
    rotate( angle_diag, [ 1, 0, 0 ] )
        translate( [ 0, -h_diag, 0 ] )
            metalon( [ w_diag, h_diag ], L_tilde );
            echo( L_tilde );

    // Travessas do assento:
    translate( [ w_lat, -w_travessa, h - h_lat - h_travessa - w_tampo ] )
        rotate( 90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
            metalon( [ w_travessa, h_travessa ], l - 2 * w_lat );
    echo( l - 2 * w_lat );
    translate( [ 0, -w + w_travessa, 0 ] )
        translate( [ w_lat, -w_travessa, h - h_lat - h_travessa - w_tampo ] )
            rotate( 90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_travessa, h_travessa ], l - 2 * w_lat );

    // Travessas inferiores:
    if ( horizontais ) {
        translate( [ w_lat, -w_travessinha, -h_travessinha - w_tampo  ] )
            rotate( 90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_travessinha, h_travessinha ], l - 2 * w_lat );
        translate( [ 0, w_travessinha - w, 0 ] )
            translate( [ w_lat, -w_travessinha, -h_travessinha - w_tampo  ] )
                rotate( 90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                    metalon( [ w_travessinha, h_travessinha ], l - 2 * w_lat );
    }
    else {
        translate( [ w_lat, 0, -h_travessinha - w_tampo  ] )
            rotate( 0, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_travessinha, h_travessinha ], w );
        translate( [ l - w_travessinha - w_lat, 0, -h_travessinha - w_tampo  ] )
            rotate( 0, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_travessinha, h_travessinha ], w );
    }

    // Travessas centrais:
    
    if ( horizontais ) {
        translate( [ w_lat + w_travessinha, -w_travessinha, -h_travessinha - w_tampo + ( h - h_lat ) / 2  ] )
            rotate( 90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                metalon( [ w_travessinha, h_travessinha ], l - 2 * w_lat - 2 * w_travessinha );
        translate( [ 0, w_travessinha - w, 0 ] )
            translate( [ w_lat + w_travessinha, -w_travessinha, -h_travessinha - w_tampo + ( h - h_lat ) / 2  ] )
                rotate( 90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
                    metalon( [ w_travessinha, h_travessinha ], l - 2 * w_lat - 2 * w_travessinha );
    }

    translate( [ w_lat, 0, -h_travessinha - w_tampo + ( h - h_lat ) / 2  ] )
        rotate( 0, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
            metalon( [ w_travessinha, h_travessinha ], w );
    translate( [ l - w_travessinha - w_lat, 0, -h_travessinha - w_tampo + ( h - h_lat ) / 2  ] )
        rotate( 0, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
            metalon( [ w_travessinha, h_travessinha ], w );
}

translate( [ w_lat + 1, -w, h - w_tampo - h_lat ] )
    color( cor_tampo )
        cube( [ l - 2 * w_lat - 2, w, w_tampo ] );
translate( [ w_lat + 1, -w, -w_tampo ] )
    color( cor_tampo )
        cube( [ l - 2 * w_lat - 2, w, w_tampo ] );
translate( [ w_lat + 1, -w, -w_tampo + ( h - h_lat ) / 2 ] )
    color( cor_tampo )
        cube( [ l - 2 * w_lat - 2, w, w_tampo ] );

echo( "Dimensões do tampo: ", l - 2 * w_lat - 2, ", ", w );
//
//echo( "Comprimento metalon diagonal: ", L_tilde );
//echo( "Ângulo metalon diagonal: ", angle_diag );