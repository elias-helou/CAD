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

hole_rad = 1.75;

// pf stands for Push-Fit:
pf_hole_dist = 25;
// gm stands for Groove Mount:
gm_attach_width = 27;
pf_attach_width = gm_attach_width - 10;
pf_attach_heigth = 4;
pf_attach_length = pf_hole_dist + 4.5;

// http://reprap.org/wiki/File:Jhn_nozzle_holder_v5.jpg
groove_rad = 15.875 / 2;

pf_screw_rad = 9.5 / 2;

render( convexity = 10 ) {
	union(){
		difference(){
			// Main body:
			translate( [ 0, 0, -5 ] )
				rcube( [ pf_attach_length, pf_attach_width, pf_attach_heigth + 5 ], r = 2 );

			// Remove rounded bottom:
			translate( [ 0, 0, -5.1 ] )
				cube( [ pf_attach_length, pf_attach_width, 5.1 ], r = 2 );

			// Remove push-fit mount space:
			translate( [ pf_attach_length / 2, pf_attach_width / 2, 1.5 ] )
			{
				cylinder( r = groove_rad, h = 5.6, $fn = 20 );
				translate( [ 0, 0, -( pf_attach_heigth / 2 + 0.1 ) ] )
					cylinder( r = 2, 5.6 + 0.1 + pf_attach_heigth / 2 + 0.1, $fn = 20 );
			}

			// Screw holes:
			translate( [ ( pf_attach_length - pf_hole_dist ) / 2, pf_attach_width / 2, -0.1 ] )
				cylinder( h = pf_attach_heigth + 0.2, r = hole_rad, $fn = 20 );
			translate( [ ( pf_attach_length + pf_hole_dist ) / 2, pf_attach_width / 2, -0.1 ] )
				cylinder( h = pf_attach_heigth + 0.2, r = hole_rad, $fn = 20 );
		}

		// Push-fit screw hole:
		translate( [ pf_attach_length / 2, pf_attach_width / 2, 1.5 ] )
			difference(){
				cylinder( r = 3, h = 1.5, $fn =20 );
				translate( [ 0, 0, -0.05 ] )
					cylinder( r = 2, h = 1.5 + 0.1, $fn =20 );
			}

	}
	
	// Push-fit screw:
 	translate( [ pf_attach_length / 2, pf_attach_width / 2, 1.5 ] )
 	{
 		difference(){
 			cylinder( r = groove_rad, h = 5.6, $fn = 20 );
 			cylinder( r = pf_screw_rad, h = 5.6 + 0.1, $fn = 20 );
 		}
 	}
}

