hole_d = 3.4 + 1;

head_d = 7.0 + 1;
head_h = 2.5;

hook_w = 12;
hook_h = 28;
hook_l= 15;

wall_w = 6;

difference(){
    union(){
        cube( [ hook_w, hook_l + wall_w, wall_w ] );
        cube( [ hook_w, wall_w, hook_h + wall_w ] );
        translate( [ 0, -hook_l, hook_h ] )
            cube( [ hook_w, hook_l + wall_w, wall_w ] );
    }
    translate( [ hook_w / 2, wall_w + hook_l / 2, -1 ] )
        cylinder( d = hole_d, h = wall_w + 2, $fn = 20 );
    translate( [ hook_w / 2, wall_w + hook_l / 2, wall_w - head_h ] )
        cylinder( d2 = head_d, d1 = hole_d, h = head_h + 1e-2, $fn = 20 );
}