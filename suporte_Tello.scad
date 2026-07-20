body_h = 33;
bottom_h = 7;

hook_w = 4;

hooks_dist = 50;

m_r = 1;

angle = 54;

module hook() {
    translate( [ -hook_w / 2, -hook_w / 2, m_r ] ){
        minkowski(){
            union(){
                cube( [ hook_w, hook_w, body_h + hook_w ] );
                translate( [ 0, 0, body_h ] )
                    cube( [ hook_w, 2 * hook_w, hook_w ] );
            }
            sphere( r = m_r, $fn = 20 );
        }
    }
}


translate( [ hooks_dist / 2, 0, 0 ] )
    rotate( angle, [ 0, 0, 1 ] )
        hook();
translate( [ -hooks_dist / 2, 0, 0 ] )
    rotate( -angle, [ 0, 0, 1 ] )
        hook();

cube( [ hooks_dist + 1.41 * hook_w, 1, 1 ] );