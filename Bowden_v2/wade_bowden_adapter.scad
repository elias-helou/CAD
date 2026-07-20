tol = 0.1;

union(){

	difference(){
		// Main body:
		cylinder( r = 15.875/2 - tol/2, h = 4.76 + 4.64 + 4.76, $fn=50 );

		// Filament hole:
		translate( [ 0, 0, -0.05 ] )
			cylinder( r = 2, h = 4.76 + 4.64 + 4.76 + 0.1, $fn = 20 );

		// Filament hole entry:
		translate( [ 0, 0, -0.05 ] )
			cylinder( r1 = 4, r2 = 2, h = 2, $fn = 20 );

		// Screw holes:
		translate( [ -14.8 / 2, 0, 4.76 + 4.64 / 2 ] ) rotate( 90, [ 1, 0, 0 ] )
			cylinder( r = 2, h = 16, $fn = 20, center = true );
		translate( [ 14.8 / 2, 0, 4.76 + 4.64 / 2 ] ) rotate( 90, [ 1, 0, 0 ] )
			cylinder( r = 2, h = 16, $fn = 20, center = true );

		// Push-fit mount:
		translate( [ 0, 0, 4.76 + 4.64 + 4.76 - 5.6 ] )
			cylinder( r = 9.5 / 2, h = 5.6 + 0.1, $fn = 20 );

	}
			
	// Push-fit guide:
	translate( [ 0, 0, 4.76 + 4.64 + 4.76 - 5.6 ] )
		difference(){
			cylinder( r = 3, h = 1.5, $fn =20 );
			translate( [ 0, 0, -0.05 ] )
				cylinder( r = 2, h = 1.5 + 0.1, $fn =20 );
		}
}
