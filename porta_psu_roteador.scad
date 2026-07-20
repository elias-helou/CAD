psu_w = 55;
psu_l = 82;

lip_h = 5;

wall_w = 6;

hole_d = 3.4 + 1;

head_d = 7.0 + 1;
head_h = 2.5;

strap_hole_l = 25;
strap_hole_w = 4;

hook_h = 30;

hole_wall_dist = 12;

difference(){
    
    union(){
        cube( [ psu_w + 2 * wall_w, psu_l + 2 * wall_w, lip_h + wall_w ] );
        cube( [ wall_w, psu_l + 2 * wall_w, hook_h ] );
    }
    translate( [ wall_w, wall_w, wall_w ] )
        cube( [ psu_w, psu_l, lip_h + 1 ] );
    
    translate( [ -1, hole_wall_dist, hook_h - ( hook_h - lip_h ) / 2 + wall_w ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d = hole_d, h = wall_w + 2, $fn = 20 );
    translate( [ wall_w - head_h, hole_wall_dist, hook_h - ( hook_h - lip_h ) / 2 + wall_w ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d2 = head_d, d1 = hole_d, h = head_h + 1e-2, $fn = 20 );

    translate( [ -1, psu_l + 2 * wall_w - hole_wall_dist, hook_h - ( hook_h - lip_h ) / 2 + wall_w ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d = hole_d, h = wall_w + 2, $fn = 20 );
    translate( [ wall_w - head_h, psu_l + 2 * wall_w - hole_wall_dist, hook_h - ( hook_h - lip_h ) / 2 + wall_w ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d2 = head_d, d1 = hole_d, h = head_h + 1e-2, $fn = 20 );
    
    translate( [ wall_w - strap_hole_w, ( psu_l + 2 * wall_w ) / 2 - strap_hole_l / 2, -1 ] )
        cube( [ strap_hole_w + 1e-2, strap_hole_l, hook_h + 2 ] );
    translate( [ wall_w + psu_w, ( psu_l + 2 * wall_w ) / 2 - strap_hole_l / 2, -1 ] )
        cube( [ strap_hole_w + 1e-2, strap_hole_l, hook_h + 2 ] );
}


