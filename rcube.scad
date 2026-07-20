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
