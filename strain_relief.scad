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

render( convexity = 10 ){
    rcube( [ 30, 8, 4 ], r = 2 );
    difference(){
        rcube( [ 3, 8, 11 ], r = 2 );
        translate( [ -5, 4, 10 - 1.7 - 0.25 ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( r = 1.7, h = 10, $fn = 20 );
    }
    translate( [ 27, 0, -10 ] )
        rcube( [ 3, 8, 14 ], r = 2 );
}
