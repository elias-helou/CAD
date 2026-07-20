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

inner_d = 10.5;
outer_d = 23;
height = 20;
wall_thick = 2;
$fn = 50;

translate ( [ 0, 0, 5 ] )
rotate ( [ atan2( 15, 37 ), 0, 0 ] ) {
	difference () {
		cylinder( h = height, r2 = 9.6 + 1, r1 = outer_d / 2, $fn = $fn );
		translate ( [ 0, 0, -0.1 ] )
			cylinder( h = height + 0.2, r = inner_d / 2, $fn = $fn );
		translate ( [ 0, 0, -0.1 ] )
			cylinder( h = 8, r = 9.6 + 1, $fn = 50 );
	}
}

base_clearance = 15;

difference () {

	union () {
		rcube( [ outer_d, outer_d, 19.5 ], center = true, r = 2 );
		rcube( [ outer_d + 4, outer_d + base_clearance, 10 ], center = true, r = 2 );
	}
	translate ( [ 0, 0, 5 ] )
	rotate ( [ atan2( 15, 37 ), 0, 0 ] )
		translate ( [ 0, 0, -20 ] )
			cylinder( h = 40, r = 9.6 + 1, $fn = 50 );
	translate( [ -50, -50, -50 ] )
		cube( [ 100, 100, 50 ] );
	translate( [ ( outer_d + 4 ) / 2 - base_clearance / 4, ( outer_d + base_clearance ) / 2 - base_clearance / 4, -0.1 ] ) {
		cylinder( r = 2, h  = 20, $fn = 20 );
		translate( [ 0, 0, 2.7 ] )
			cylinder( r1 = 2, r2 = 3.5, h = 2.5, $fn = 20 );
	}
	translate( [ -( outer_d + 4 ) / 2 + base_clearance / 4, ( outer_d + base_clearance ) / 2 - base_clearance / 4, -0.1 ] ) {
		cylinder( r = 2, h  = 20, $fn = 20 );
		translate( [ 0, 0, 2.7 ] )
			cylinder( r1 = 2, r2 = 3.5, h = 2.5, $fn = 20 );
	}
	translate( [ -( outer_d + 4 ) / 2 + base_clearance / 4, -( outer_d + base_clearance ) / 2 + base_clearance / 4, -0.1 ] ) {
		cylinder( r = 2, h  = 20, $fn = 20 );
		translate( [ 0, 0, 2.7 ] )
			cylinder( r1 = 2, r2 = 3.5, h = 2.5, $fn = 20 );
	}
	translate( [ ( outer_d + 4 ) / 2 - base_clearance / 4, -( outer_d + base_clearance ) / 2 + base_clearance / 4, -0.1 ] ) {
		cylinder( r = 2, h  = 20, $fn = 20 );
		translate( [ 0, 0, 2.7 ] )
			cylinder( r1 = 2, r2 = 3.5, h = 2.5, $fn = 20 );
	}
}