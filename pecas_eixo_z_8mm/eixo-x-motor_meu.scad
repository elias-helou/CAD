render( convexity = 10 ){
    union(){
        difference(){
            //import( "XaxisWithMotor_new.stl", convexity = 10 );
        
//            translate( [ -5.01, 40, -1 ] ) cube( [ 6.5, 30, 22 ] );
        }
//        translate( [ -11, 37.9, 0 ] )
//            cylinder( r = 2.6, h = 8, $fn = 100 );
//        translate( [ -11, 21.9, 0 ] )
//            cylinder( r = 2.6, h = 8, $fn = 100 );
    }
}


s_wall = 3;
b_dist = 15;
b_dist_large = 19;
c_wall = 1.5;
c_wall_new = 2.0;
fn = 100;

function pie_outline( r, theta ) =
    [
        [ 0, 0 ],
        for ( i = [ 0 : fn - 1 ] )
            [ r * sin( i * theta / ( fn - 1 ) ), r * cos( i * theta / ( fn - 1 ) ) ],
    ];

module slice( theta ){
    intersection(){
        translate( [ 0, 0, -1 ] )
            linear_extrude( height = 62 )
                polygon( points = pie_outline( 1 * ( 7.5 + c_wall_new + 1 ), theta ) );
    }
}

module x_motor(){

difference(){
    union(){
        // Corpo
        difference(){
            union(){
                cube( [ 17, 40, 60 ] );
            }
            // Furos para os eixos cilíndricos:
            translate( [ 8.5, -1, 7.5 ] )
                rotate( -90, [ 1, 0, 0 ] )
                    cylinder( r = 4, h = 42, $fn = 100 );
            translate( [ 8.5, -1, 60 - 7.5 ] )
                rotate( -90, [ 1, 0, 0 ] )
                    cylinder( r = 4, h = 42, $fn = 100 );
            // Vão para a correia:
            translate( [ s_wall, -1, b_dist ] )
                cube( [ 17 - 2 * s_wall, 40 + 2, 60 - 2 * b_dist ] );
        }
        
        // Conexão com o motor:
        difference(){
            union(){
                intersection(){
                    union(){
                        // Hastes para o motor:
                        translate( [ 0, -15, 0 ] )
                            cube( [ 17, 16, 51.5 ] );
                        translate( [ 0, -46.5, 0 ] )
                            cube( [ 17, 47.5, 21 ] );
                    }
                    translate( [ -1, -25, 30 ] )
                        rotate( 90, [ 0, 1, 0 ] )
                            cylinder( r = 30, h = 19, $fn = 100 );
                }
                translate( [ 0, -25, 0 ] )
                    cube( [ 17, 25, b_dist ] );
            }
            // Vão para a correia:
            translate( [ s_wall, -25, b_dist_large ] )
                cube( [ 17 - 2 * s_wall, 40 + 2, 60 - 2 * b_dist_large ] );
            // Vão para o eixo do motor:
            translate( [ -1, -25, 30 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 15.2, h = 19, $fn = 100 );
            // Parafusos do motor:
            translate( [ -1, -9.5, 14.5 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 2, h = 19, $fn = 100 );
            translate( [ -1, -9.5, 14.5 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 3, h = 5.5, $fn = 100 );
            translate( [ -1, -9.5, 45.5 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 2, h = 19, $fn = 100 );
            translate( [ -1, -9.5, 45.5 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 3, h = 5.5, $fn = 100 );
            translate( [ -1, -40.5, 14.5 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 2, h = 19, $fn = 100 );
            translate( [ -1, -40.5, 14.5 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = 3, h = 5.5, $fn = 100 );
        }
    
        // Conexão com o eixo (rolamentos):
        difference(){
            union(){
                translate( [ -7.5 - c_wall, 7.5 + c_wall, 0 ] )
                    cylinder( r = 7.5 + c_wall_new, h = 60, $fn = 100 );
                translate( [ -7.5 - c_wall_new, 0, 0 ] )
                    cube( [ 7.5 + c_wall_new, 15 + 2 * c_wall, 60 ] );
            }
            translate( [ -7.5 - c_wall, 7.5 + c_wall, -1 ] )
                cylinder( r = 7.5, h = 62, $fn = 100 );
            translate( [ -7.5 - c_wall, 7.5 + c_wall, 0 ] )
                rotate( 20, [ 0, 0, 1 ] )
                    slice( 10 );
        }
        
        // Conexão com o motor (rosca):
        difference(){
            union(){
                translate( [ -11, 30, 0 ] )
                    scale( [ 1.1, 1, 1 ] )
                        cylinder( r = 11, h = 8, $fn = 100 );
                translate( [ -7.5 - c_wall, 7 + 10.9, 0 ] )
                    cube( [ 7.5 + c_wall_new, 22.1, 8 ] );
            }
            translate( [ -11, 30, -1 ] )
                    cylinder( r = 4.5, h = 10, $fn = 100 );
            translate( [ -11, 30, 6 ] )
                    cylinder( r = 5.2, h = 10, $fn = 100 );
            translate( [ -3, 30, -1 ] )
                    cylinder( r = 2, h = 10, $fn = 100 );
            translate( [ -19, 30, -1 ] )
                    cylinder( r = 2, h = 10, $fn = 100 );
        }
    }
translate( [ 0, -1.9, b_dist ] )
    rotate( 45, [ 0, 0, 1 ] )
        translate( [ -7.55, 0, 0 ] )
            cube( [ 15, 3, 4 ] );
translate( [ 0, -1.9, 60 - b_dist - 4 ] )
    rotate( 45, [ 0, 0, 1 ] )
        translate( [ -7.55, 0, 0 ] )
            cube( [ 15, 3, 4 ] );
translate( [ 0, 18.2, b_dist ] )
    rotate( -45, [ 0, 0, 1 ] )
        translate( [ -7.55, 0, 0 ] )
            cube( [ 15, 3, 4 ] );
translate( [ 0, 18.2, 60 - b_dist - 4 ] )
    rotate( -45, [ 0, 0, 1 ] )
        translate( [ -7.55, 0, 0 ] )
            cube( [ 15, 3, 4 ] );
}
}

x_motor();
