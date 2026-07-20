fan_w = 50;
fan_h = 1.6;
n_slots = 8;
w_column = 2;
w_slot = ( fan_w - w_column ) / n_slots - w_column;
col_w = 2.4;
hole_d = 40;
hole_support_r = - ( hole_d - fan_w ) / 2 - 1.5;
hole_r = 1.7;

render( convexity = 10 ){
    difference(){
        union(){
            // Grid:
            difference(){
                cube( [ fan_w, fan_w, fan_h ] );
                for ( i = [ 0 : n_slots - 1 ] ){
                    translate( [ w_column + i * ( w_slot + w_column ), col_w, -1 ] )
                        cube( [ w_slot, fan_w - 2 * col_w,  fan_h + 2 ] );
                }
            }
            // Screw support:
            translate( [ - ( hole_d - fan_w ) / 2, - ( hole_d - fan_w ) / 2, 0 ] )
                    cylinder( h = fan_h,  r = hole_support_r, $fn = 20 );
            translate( [ hole_d - ( hole_d - fan_w ) / 2, -( hole_d - fan_w ) / 2, 0 ] )
                    cylinder( h = fan_h,  r = hole_support_r, $fn = 20 );
            translate( [ - ( hole_d - fan_w ) / 2, hole_d - ( hole_d - fan_w ) / 2, 0 ] )
                    cylinder( h = fan_h,  r = hole_support_r, $fn = 20 );
            translate( [ hole_d - ( hole_d - fan_w ) / 2, hole_d - ( hole_d - fan_w ) / 2, 0 ] )
                    cylinder( h = fan_h,  r = hole_support_r, $fn = 20 );
        }
        
        // Screw holes:
            translate( [ - ( hole_d - fan_w ) / 2, - ( hole_d - fan_w ) / 2, -1 ] )
                    cylinder( h = fan_h + 2,  r = hole_r, $fn = 20 );
            translate( [ hole_d - ( hole_d - fan_w ) / 2, -( hole_d - fan_w ) / 2, -1 ] )
                    cylinder( h = fan_h + 2,  r = hole_r, $fn = 20 );
            translate( [ - ( hole_d - fan_w ) / 2, hole_d - ( hole_d - fan_w ) / 2, -1 ] )
                    cylinder( h = fan_h + 2,  r = hole_r, $fn = 20 );
            translate( [ hole_d - ( hole_d - fan_w ) / 2, hole_d - ( hole_d - fan_w ) / 2, -1 ] )
                    cylinder( h = fan_h + 2,  r = hole_r, $fn = 20 );
    }
}