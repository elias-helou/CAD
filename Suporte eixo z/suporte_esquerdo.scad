bearing_radius = 28.1 / 2;
bearing_height = 7;
wall_thickness = 3;

difference(){
	union() {
		// Bearing support wall
		cylinder( r = bearing_radius + wall_thickness, h = bearing_height, $fn = 100 );

		// Outer side fixture support:
		translate( [ 0, -bearing_radius, 0 ] )
			cube( [ 40, bearing_radius, bearing_height ] );
		translate( [ 30, - bearing_radius, - bearing_height ] )
			cube( [ 10, bearing_radius, bearing_height ] );
	}
	// Bearing support hole
	translate( [ 0, 0, -0.1 ] )
		cylinder( r = bearing_radius, h = bearing_height + 0.2, $fn = 100 );

	// Captive nut hole:
	translate( [ 30 - 0.1, - bearing_radius / 2, -bearing_height / 2 ] )
		rotate( 90, [ 0, 1, 0 ] )
			rotate( 90, [ 0, 0, 1 ] )
				cylinder( h = 2.3, r = 6.1 / 2, $fn=6 );
	// Screw hole:
	translate( [ 30 - 2.2, - bearing_radius / 2, -bearing_height / 2 ] )
		rotate( 90, [ 0, 1, 0 ] )
			cylinder( h = 31, r = 2, $fn=100 );

	// Groove for easier bearing fit:
	translate( [ -( bearing_radius + wall_thickness ), - wall_thickness / 2, -0.1 ] )
	cube( [ wall_thickness + 0.1, wall_thickness, bearing_height + 0.2 ] );

}
difference(){
	// Inner side fixture support:
	translate( [ 3, - ( bearing_radius + wall_thickness ), - bearing_height ] )
		cube( [ 7, ( bearing_radius + wall_thickness ) * 2, bearing_height ] );

	// Captive nut hole:
	translate( [ 10 - 2.2, - bearing_radius / 2, -bearing_height / 2 ] )
		rotate( 90, [ 0, 1, 0 ] )
			rotate( 90, [ 0, 0, 1 ] )
				cylinder( h = 2.3, r = 6.1 / 2, $fn=6 );

	// Screw hole:
	translate( [ 4 - 2.2, - bearing_radius / 2, -bearing_height / 2 ] )
		rotate( 90, [ 0, 1, 0 ] )
			cylinder( h = 11, r = 2, $fn=100 );

	// Round rough edges:
	translate( [ 0, 0, -30 ] )
		difference(){
			cylinder( h = 30, r = 100, $fn = 100 );
			cylinder( h = 30, r = bearing_radius + wall_thickness, $fn = 100 );
		}
}