include <../rcube.scad>

// Body shell thickness:
bst = 2.5 * [ 1, 1, 1 ];
// Phone body dimensions:
pbd = [ 129.9, 65.9, 11.6 ];

difference () {
	// Main body:
	rcube( pbd + bst, center = true, r = 1, $fn = 20 );
	// Main space:
	rcube( pbd, center = true, r = 1, $fn = 20 );
	translate ( [ pbd[ 0 ] / 2, 0.1, 0 ] )
		scale( 1.1 )
			cube( pbd + bst, center = true );
}
