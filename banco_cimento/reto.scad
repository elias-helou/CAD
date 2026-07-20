include <molde_defs.scad>;

st_wall_l = 125;

cube( [ wall, st_wall_l, h ] );

difference(){
    union(){
        cube( [ wall + c_length, c_thick / 2, h ] );
        translate( [ 0, st_wall_l - c_thick / 2, 0 ] )
            cube( [ wall + c_length, c_thick / 2, h ] );
    }
    translate( [ wall + c_length / 2, 1.5 * st_wall_l, h / 4 ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( h = 2 * st_wall_l, r = hole_r, $fn = fn );
    translate( [ wall + c_length / 2, 1.5 * st_wall_l, h - h / 4 ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( h = 2 * st_wall_l, r = hole_r, $fn = fn );
}

translate( [ 0, st_wall_l / 2 - c_width / 2, 0 ] ){
    difference(){
        cube( [ c_length + wall, c_width, bc_thick ] );
        translate( [ wall + c_length / 2, c_width / 2 - c_width / par_1, -1 ] )
            cylinder( h = bc_thick + 2, r = bhole_r, $fn = fn );
        translate( [ wall + c_length / 2, c_width / 2 + c_width / par_1, -1 ] )
            cylinder( h = bc_thick + 2, r = bhole_r, $fn = fn );
    }
}
