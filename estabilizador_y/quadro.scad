// Cube with rounded edges

el = 1e-2;

module rcube_rcorner ( r, fn )
{
   difference() {
      translate ( -el * [ 1, 1, 1 ] ) cube( r + el );
      translate ( [ r, r, r ] ) sphere( r, $fn = fn );
   }
}

module rcube_redge ( r, l, fn )
{
   difference() {
      translate ( -2 * el * [ 1, 1, 1 ] ) cube( [ r + 2 * el, r + 2 * el, l + 4 * el ] );
      translate ( [ r, r, -el ] ) cylinder( r = r, h = l + 2 * el, $fn = fn );
   }
}

module rcube( size = 1, center = false, r = 0, $fn = 20 )
{
        sz = len( size ) == undef ? [ size, size, size ] : size;
        displacement = center == true ? -size / 2: [ 0, 0, 0 ];

        translate( displacement ) {
                difference() {
                        cube( size = sz );
                        union (){
                                // Round the edges:

                                rcube_redge( r, sz[2], fn = $fn );
                                translate( [ sz[0], 0, 0 ] ) rotate( 90, [ 0, 0, 1 ] ) rcube_redge( r, sz[2], fn = $fn );
                                translate( [ sz[0], sz[1], 0 ] ) rotate( 180, [ 0, 0, 1 ] ) rcube_redge( r, sz[2], fn = $fn );
                                translate( [ 0, sz[1], 0 ] ) rotate( 270, [ 0, 0, 1 ] ) rcube_redge( r, sz[2], fn = $fn );

                                translate( [ 0, sz[1], 0 ] ) rotate ( 90, [ 1, 0, 0 ] ) rcube_redge( r, sz[1], fn = $fn );
                                translate( [ 0, 0, sz[2] ] ) rotate ( -90, [ 1, 0, 0 ] ) rcube_redge( r, sz[1], fn = $fn );
                                translate( [ sz[0], 0, 0 ] ) rotate ( 180, [ 0, 1, 1 ] ) rcube_redge( r, sz[1], fn = $fn );
                                translate( [ sz[0], sz[1], sz[2] ] ) rotate ( 180, [ 0, 1, -1 ] ) rcube_redge( r, sz[1], fn = $fn );

                                translate( [ sz[0], 0, 0 ] ) rotate( -90, [ 0, 1, 0 ] )  rcube_redge( r, sz[0], fn = $fn );
                                translate( [ 0, 0, sz[2] ] ) rotate( 90, [ 0, 1, 0 ] )  rcube_redge( r, sz[0], fn = $fn );
                                translate( [ 0, sz[1], 0 ] ) rotate( 180, [ 1, 0, 1 ] )  rcube_redge( r, sz[0], fn = $fn );
                                translate( [ sz[0], sz[1], sz[2] ] ) rotate( 180, [ 1, 0, -1 ] )  rcube_redge( r, sz[0], fn = $fn );

                                // Round the corners:
                                rcube_rcorner( r, fn = $fn );
                                translate( [ sz[0], 0, 0 ] ) rotate( 90, [ 0, 0, 1 ] ) rcube_rcorner( r, fn = $fn );
                                translate( [ sz[0], sz[1], 0 ] ) rotate( 180, [ 0, 0, 1 ] ) rcube_rcorner( r, fn = $fn );
                                translate( [ 0, sz[1], 0 ] ) rotate( 270, [ 0, 0, 1 ] ) rcube_rcorner( r, fn = $fn );

                                translate( [ 0, 0, sz[2] ] ) rotate( 90, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcube_rcorner( r, fn = $fn );
                                translate( [ sz[0], 0, sz[2] ] ) rotate( 180, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcube_rcorner( r, fn = $fn );
                                translate( [ sz[0], sz[1], sz[2] ] ) rotate( 270, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcube_rcorner( r, fn = $fn );
                                translate( [ 0, sz[1], sz[2] ] ) rotate( 180, [ 1, 0, 0 ] ) rcube_rcorner( r, fn = $fn );

                        }
                }
        }
}

inner_d = 11;
outer_d = 30;
height = 20;
wall_thick = 2;
$fn = 50;

translate ( [ 0, -15, 15 ] )
rotate ( [ atan2( 15, -37 ), 0, 0 ] ) {
	difference () {
		cylinder( h = height, r = outer_d / 2, $fn = $fn );
		translate ( [ 0, 0, -0.1 ] )
			cylinder( h = height + 0.2, r = inner_d / 2, $fn = $fn );
		translate ( [ 0, 0, -0.1 ] )
			cylinder( h = 8, r = 9.6 + 1, $fn = 20 );
		translate ( [ 0, 0, +0.1 + height - 8 ] )
			cylinder( h = 8, r = 9.6 + 1, $fn = 20 );
	}
}
difference(){
	translate( [ -15, -7, -10 ] )
		rcube( [ 30, 13, 38 ], r = 2 );
	translate ( [ 0, -15, 15 ] )
		rotate ( [ atan2( 15, -37 ), 0, 0 ] )
			translate ( [ 0, 0, -20.1 ] )
				cylinder( h = 28, r = 9.6 + 1, $fn = 20 );
	translate( [ -10, 10, 28 - 10 ] )
		rotate ( [ 90, 0, 0 ] ) {
			cylinder( r = 2, h = 30, $fn = 20 );
		}
	translate( [ -10, -7 + 2.3, 28 - 10 ] )
		rotate ( [ 90, 0, 0 ] ) {
			cylinder( r = 3.05, h = 30, $fn = 6 );
		}
	translate( [ 10, 10, 28 - 10 ] )
		rotate ( [ 90, 0, 0 ] ) {
			cylinder( r = 2, h = 30, $fn = 20 );
		}
	translate( [ 10, -7 + 2.3, 28 - 10 ] )
		rotate ( [ 90, 0, 0 ] ) {
			cylinder( r = 3.05, h = 30, $fn = 6 );
		}
	translate( [ -20, 3, -20 ] )
		cube( [ 40, 10, 58 ], r = 2 );
}
difference(){
	translate( [ -12, -12, -10 ] )
		rcube( [ 24, 10, 10 ], r = 2 );
	translate ( [ 0, -15, 15 ] )
		rotate ( [ atan2( 15, -37 ), 0, 0 ] )
			translate ( [ 0, 0, +0.1 + height - 8 ] )
				cylinder( h = 8, r = 9.6 + 1, $fn = 20 );
}
