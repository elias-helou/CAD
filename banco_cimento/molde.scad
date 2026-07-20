include <molde_defs.scad>

module side_connect(){
    difference(){
        translate( [ -c_thick / 2, r + wall / 2, 0 ] )
            cube( [ c_thick, c_length + wall / 2, h ] );
    
        translate( [ 0, 0, h / 4 ] )
            rotate( 90, [ 0, 1, 0 ] )
                translate( [ 0, r + wall + c_length / 2, -c_thick ] )
                    cylinder( h = 2 * c_thick, r = hole_r, $fn = fn );
        translate( [ 0, 0, h - h / 4 ] )
            rotate( 90, [ 0, 1, 0 ] )
                translate( [ 0, r + wall + c_length / 2, -c_thick ] )
                    cylinder( h = 2 * c_thick, r = hole_r, $fn = fn );
    }
}

module bottom_connect(){
    difference(){
        translate( [ -c_width / 2, r, 0 ] )
            cube( [ c_width, c_length + wall, bc_thick ] );
        translate( [ c_width / 2 - c_width / par_1, r + wall + c_length / 2, -1 ] )
            cylinder( h = c_thick + 2, r = bhole_r, $fn = fn );
        translate( [ -c_width / 2 + c_width / par_1, r + wall + c_length / 2, -1 ] )
            cylinder( h = c_thick + 2, r = bhole_r, $fn = fn );
    }
}

module perimeter(){
    difference(){
        union(){
            cylinder( h = h, r = r + wall, $fn = fn );
            for ( i = [ 0 : N - 1 ] ){
                rotate( i * 360 / N, [ 0, 0, 1 ] )
                    side_connect();
                rotate( ( i + 0.5 ) * 360 / N, [ 0, 0, 1 ] )
                    bottom_connect();
            }
        }
            
        translate( [ 0, 0, -1 ] )
            cylinder( h = h + 2, r = r, $fn = fn );
    }
}

function pie_outline( r, theta ) =
    [
        [ 0, 0 ],
        for ( i = [ 0 : fn - 1 ] )
            [ r * sin( i * theta / ( fn - 1 ) ), r * cos( i * theta / ( fn - 1 ) ) ],
    ];

module slice(){
    intersection(){
        translate( [ 0, 0, -1 ] )
            linear_extrude( height = h + 2 )
                polygon( points = pie_outline( 2 * r , 360 / N ) );
        perimeter();
    }
}

module slice_leg(){
    difference(){
        slice();
        rotate( -180 / N, [ 0, 0, 1 ] )
        translate( [ 0, r + 1.5 * wall, h ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( h = 2 * wall, d = leg_d, $fn = fn );
        rotate( ( -180 / N ) * 0.5 ,  [ 0, 0, 1 ] )
            translate( [ 0, r + 0.5 * wall, -10 ] )
                cylinder( h = h + 20, d = 4.8, $fn = fn );
        rotate( ( -180 / N ) * 1.5 ,  [ 0, 0, 1 ] )
            translate( [ 0, r + 0.5 * wall, -10 ] )
                cylinder( h = h + 20, d = 4.8, $fn = fn );
    }
}

//for ( i = [ 0 : N - 1 ] )
//    rotate( i * 360 / N, [ 0, 0, 1 ] )
//        translate( explode_r * [ sin( 180 / N ), cos( 180 / N ), 0 ] )
//            if ( i % 2 == 0 )
//                slice();
//            else
//                slice_leg();
//slice_leg();

//module slice_small(){
//    intersection(){
//        translate( [ 0, 0, -1 ] )
//            linear_extrude( height = h + 2 )
//                polygon( points = pie_outline( 2 * r , 360 / N ) );
//        perimeter();
//    }
//}

translate( [ 0, 0, h ] ){
    difference(){
        union(){
            intersection(){
                difference(){
                    cylinder( h = 10, r = r + wall, $fn = fn );
                    translate( [ 0, 0, -1 ] )
                        cylinder( h = h + 2, r = r, $fn = fn );
                    rotate( ( -180 / N ) * 0.5,  [ 0, 0, 1 ] )
                        translate( [ 0, r + 0.5 * wall, -10 ] )
                            cylinder( h = h + 20, d = 5.2, $fn = fn );
                    rotate( ( -180 / N ) * 1.5 ,  [ 0, 0, 1 ] )
                        translate( [ 0, r + 0.5 * wall, -10 ] )
                            cylinder( h = h + 20, d = 5.2, $fn = fn );
                }
                rotate( -360 / N * 0.25 / 2, [ 0, 0, 1 ] )
                    translate( [ 0, 0, -1 ] )
                        linear_extrude( height = h + 2 )
                            polygon( points = pie_outline( 2 * r , 360 / N * 0.75 ) );
            }
            intersection(){
                rotate( -180 / N, [ 0, 0, 1 ] )
                    rotate( -90, [ 1, 0, 0 ] )
                        cylinder( d = leg_d + 2 * 15, h = r + wall, $fn = fn );
                        difference(){
                            cylinder( h = leg_d + 2 * 15, r = r + wall, $fn = fn );
                            translate( [ 0, 0, -1 ] )
                                cylinder( h = leg_d + 2 * 15 + 2, r = r, $fn = fn );
                        }
            }
        }
        rotate( -180 / N, [ 0, 0, 1 ] )
            rotate( -90, [ 1, 0, 0 ] )
                cylinder( d = leg_d, h = r + wall + 1, $fn = fn );
        rotate( -180 / N, [ 0, 0, 1 ] )
            translate( [ 0, r + wall, 0 ] )
                rotate( -30, [ 1, 0, 0 ] )
                    cylinder( d = leg_d, h = r + wall + 1, $fn = fn );
    }
}
