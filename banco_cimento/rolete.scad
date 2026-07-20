small_r = 7.5;
large_r = 15;
screw_r = 1.5; // Parafuso M3 no eixo.
wall_t = 2;
tol = 1;
hole_r = screw_r + wall_t + tol;

fn = 100;

module rodela(){
    difference(){
        union(){
            rotate_extrude( $fn = fn ){
                translate( [ -large_r, 0, 0 ] )
                    circle( r = small_r );
            }
            translate( [ 0, 0, -small_r ] )
                cylinder( h = 2 * small_r, r = large_r, $fn = fn );
        }
        
        translate( [ 0, 0, -small_r -1 ] )
            cylinder( h = 2 * small_r + 2, r = hole_r, $fn = fn );
    }
}

rodela();