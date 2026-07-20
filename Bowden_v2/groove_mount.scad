// Cube with rounded edges

el = 1e-2;
fn = 20;

module rcorner ( r )
{
   difference() {
      translate ( -el * [ 1, 1, 1 ] ) cube( r + el );
      translate ( [ r, r, r ] ) sphere( r, $fn = fn );
   }
}

module redge ( r, l )
{
   difference() {
      translate ( -2 * el * [ 1, 1, 1 ] ) cube( [ r + 2 * el, r + 2 * el, l + 4 * el ] );
      translate ( [ r, r, -el ] ) cylinder( r = r, h = l + 2 * el, $fn = fn );
   }
}

module rcube( size = 1, center = false, r = 0 )
{
        sz = len( size ) == undef ? [ size, size, size ] : size;

        difference() {
                cube( size = sz );
                union (){
                        // Round the edges:

                        redge( r ,sz[2] );
                        translate( [ sz[0], 0, 0 ] ) rotate( 90, [ 0, 0, 1 ] ) redge( r ,sz[2] );
                        translate( [ sz[0], sz[1], 0 ] ) rotate( 180, [ 0, 0, 1 ] ) redge( r ,sz[2] );
                        translate( [ 0, sz[1], 0 ] ) rotate( 270, [ 0, 0, 1 ] ) redge( r ,sz[2] );

                        translate( [ 0, sz[1], 0 ] ) rotate ( 90, [ 1, 0, 0 ] ) redge( r ,sz[1] );
                        translate( [ 0, 0, sz[2] ] ) rotate ( -90, [ 1, 0, 0 ] ) redge( r ,sz[1] );
                        translate( [ sz[0], 0, 0 ] ) rotate ( 180, [ 0, 1, 1 ] ) redge( r ,sz[1] );
                        translate( [ sz[0], sz[1], sz[2] ] ) rotate ( 180, [ 0, 1, -1 ] ) redge( r ,sz[1] );

                        translate( [ sz[0], 0, 0 ] ) rotate( -90, [ 0, 1, 0 ] )  redge( r ,sz[0] );
                        translate( [ 0, 0, sz[2] ] ) rotate( 90, [ 0, 1, 0 ] )  redge( r ,sz[0] );
                        translate( [ 0, sz[1], 0 ] ) rotate( 180, [ 1, 0, 1 ] )  redge( r ,sz[0] );
                        translate( [ sz[0], sz[1], sz[2] ] ) rotate( 180, [ 1, 0, -1 ] )  redge( r ,sz[0] );

                        // Round the corners:
                        rcorner( r );
                        translate( [ sz[0], 0, 0 ] ) rotate( 90, [ 0, 0, 1 ] ) rcorner( r );
                        translate( [ sz[0], sz[1], 0 ] ) rotate( 180, [ 0, 0, 1 ] ) rcorner( r );
                        translate( [ 0, sz[1], 0 ] ) rotate( 270, [ 0, 0, 1 ] ) rcorner( r );

                        translate( [ 0, 0, sz[2] ] ) rotate( 90, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );
                        translate( [ sz[0], 0, sz[2] ] ) rotate( 180, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );
                        translate( [ sz[0], sz[1], sz[2] ] ) rotate( 270, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );
                        translate( [ 0, sz[1], sz[2] ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );

                }
        }
}

delta = ( 35 - 23 ) / 2;
hole_rad = 2;
inner_hole = 35 - 3 * delta;

gm_hole_dist = 28;
pf_hole_dist = 25;
gm_attach_width = 35;

tol = 0.2;

// http://reprap.org/wiki/File:Jhn_nozzle_holder_v5.jpg
groove_inner_rad = ( 12 + tol ) / 2;
groove_rad = ( 15.875 + tol ) / 2;

render( convexity = 10 ){

	// Carriage attachment:
	difference(){
		union() {
			// Main body:
			translate( [ 0, 0, -2 ] )
				rcube( [ 35, 35, 9 ], r = 2 );

			// Endstop actuator:
			rotate( -135, [ 0, 0, 1 ] )
				translate( [ -delta * 1.42, -2.5, 0 ] )
					difference(){
						cube( [ 1.42 * 30, 5, 5 ] );
						translate( [ 1.42 * 30, 0, 0 ] )
							rotate( -45, [ 0, 0, 1 ] )
								cube( [ 5 * 1.42, 8, 15 ], center = true );
					}
		}


		// Remove base rounding:
		translate( [ 0, 0, -2 ] )
			cube( [ 35, 35, 2 ] );

		// Screw holes:
		translate( [ delta, delta, -0.1 ] )
			cylinder( h = 7.2, r = hole_rad, $fn = 50 );
		translate( [ 35 - delta, delta, -0.1 ] )
			cylinder( h = 7.2, r = hole_rad, $fn = 50 );
		translate( [ 35 - delta, 35 - delta, -0.1 ] )
			cylinder( h = 7.2, r = hole_rad, $fn = 50 );
		translate( [ delta, 35 - delta, -0.1 ] )
			cylinder( h = 7.2, r = hole_rad, $fn = 50 );

	}

	// J-head attachment:
    gm_attach_delta = 16;
	difference(){
		union(){
			// Main body:
			translate( [ ( 35 - gm_attach_width ) / 2, ( 35 - inner_hole ) / 2 + inner_hole - gm_attach_delta, 0 ] )
				rcube( [ gm_attach_width, 15, 45 ], r = 2 );
		}
		// Remove attachment rounding:
		translate( [ ( 35 - gm_attach_width ) / 2, ( 35 - inner_hole ) / 2 + inner_hole - gm_attach_delta - 1, 40 ] )
			cube( [ gm_attach_width, 17, 5.1 ] );

		// Groove mount:
		translate( [ 35 / 2, ( 35 - inner_hole ) / 2 + inner_hole - gm_attach_delta - 0.1, 40 ] ){
			rotate( -90, [ 1, 0, 0 ] ) {
				cylinder( r = groove_inner_rad, h = 10 + 0.1, $fn = 50 );
				cylinder( r = groove_rad, h = 4.76 + tol + 0.1, $fn = 50 );
				translate( [ 0, 0, 4.76 + tol + 4.64 - tol + 0.1 ] )
					cylinder( r = groove_rad, h = 4.76 + tol + 5, $fn = 50 );
			}
		}

		// Threaded insert and screw holes:
		translate( [ 0, ( 35 - inner_hole ) / 2 + inner_hole - gm_attach_delta + 15 / 2, 0 ] )
		{
            // Threaded insert holes:
			translate( [ ( 35 - gm_hole_dist ) / 2, 0, 35 ] )
				cylinder( h = 5.1, r = 5.3 / 2.0 - 0.2, $fn = 50 );
			translate( [ ( 35 + gm_hole_dist) / 2, 0, 35 ] )
				cylinder( h = 5.1, r = 5.3 / 2.0 - 0.2, $fn = 50 );

            // Tight section:
			translate( [ ( 35 - gm_hole_dist ) / 2, 0, 31 ] )
				cylinder( h = 4, r = 4 / 2, $fn = 50 );
			translate( [ ( 35 + gm_hole_dist) / 2, 0, 31 ] )
				cylinder( h = 4, r = 4 / 2, $fn = 50 );

            // Transition section (for 3D printing):
			translate( [ ( 35 - gm_hole_dist ) / 2, 0, 26 ] )
				cylinder( h = 5, r2 = 4 / 2, r1 = 4 / 2 + 1.4, $fn = 50 );
			translate( [ ( 35 + gm_hole_dist) / 2, 0, 26 ] )
				cylinder( h = 5, r2 = 4 / 2, r1 = 4 / 2 + 1.4, $fn = 50 );

            // Loose section:
			translate( [ ( 35 - gm_hole_dist ) / 2, 0, 10 ] )
				cylinder( h = 16, r = 4 / 2 + 1.4, $fn = 50 );
			translate( [ ( 35 + gm_hole_dist) / 2, 0, 10 ] )
				cylinder( h = 16, r = 4 / 2 + 1.4, $fn = 50 );
		}
	}
}
