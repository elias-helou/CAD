d_parafusos = 40;
l_placa = 48.5;
c_suporte = 20;
p_suporte = 10;

render( convexity =  10 ) {

    difference() {
        translate( [ 0, 0, -3.35 ] )
            rotate( 15, [ 1, 0, 0 ] ) {
                difference(){
                    union(){
                        cube( [ l_placa, c_suporte, p_suporte ] );
                        translate( [ ( l_placa - d_parafusos ) / 2, 4.5, p_suporte - 1 ] )
                            cylinder( r = 3.5, h = 4, $fn = 20 );
                        translate( [ l_placa - ( l_placa - d_parafusos ) / 2, 4.5, p_suporte - 1 ] )
                            cylinder( r = 3.5, h = 4, $fn = 20 );
                    }
                    translate( [ ( l_placa - d_parafusos ) / 2, 4.5, -1 ] ) {
                        cylinder( r = 1.5, h = p_suporte + 10, $fn = 20 );
                        cylinder( r = 4.2, h = p_suporte - 5, $fn = 20 );
                    }
                    translate( [ l_placa - ( l_placa - d_parafusos ) / 2, 4.5, -1 ] ) {
                        cylinder( r = 1.5, h = p_suporte + 10, $fn = 20 );
                        cylinder( r = 4.2, h = p_suporte - 5, $fn = 20 );
                    }
                }
                
                translate(  [ ( l_placa - d_parafusos ) / 2 - 1, c_suporte - 10, 0 ]  )
                    cube( [ 2, 10, p_suporte + 3 ] );
                translate(  [ l_placa -  ( l_placa - d_parafusos ) / 2 - 1, c_suporte - 10, 0 ]  )
                    cube( [ 2, 10, p_suporte + 3 ] );
                
//                translate( [ ( l_placa - d_parafusos ) / 2, 4.5, p_suporte - 7 ] )
//                    cylinder( r = 2.8, h = 10, $fn = 20 );
            }
        translate( [ -1, -1, -10 ] )
            cube( [ 100, 100, 10 ] );
        translate( [ ( l_placa - 20 ) / 2, -10, 3 ] )
            cube( [ 20, 100, 10 ] );
        translate( [ ( l_placa - 20 ) / 2, 12.5, -1 ] )
            cube( [ 20, 100, 10 ] );
    }
//        translate( [ ( l_placa - 20 ) / 2, 10, -1 ] )
//            cube( [ 20, 100, 10 ] );
}