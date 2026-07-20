module lb_socket( r, h, wall_thickness = 2, opening_length = 1, $fn = 20 ) {
	difference () {
		cylinder( r = r + wall_thickness, h = h, $fn = $fn );
		translate( [ 0, 0, -0.1 ] ) {
			cylinder( r = r, h = h + 0.2, $fn = $fn );
			translate( [ -opening_length / 2, r - 0.2, 0 ] )
				cube( [ opening_length, wall_thickness + 0.4, h + 0.2 ] );
		}
	}
}

lb_socket( 7.5, 24, $fn = 50 );
translate ( [ 0, -0.5, 2 * 24 ] )
	lb_socket( 7.5, 24, $fn = 50 );
translate ( [ 0, 0, 4 * 24 ] )
	lb_socket( 7.5, 24, $fn = 50 );
basis_width = 0.85 * 2 * 7.5;
basis_height = 0.74 * 2 * 7.5;
difference (){
	union (){
		translate( [ - basis_width / 2, - basis_height, 0 ] )
			cube( [ basis_width, basis_height, 5 * 24 ] );
		translate ( [ -15, -basis_height, 5 * 24 / 2 - 15 / 2 - 70 / 2 ] )
			difference() {
				cube( [ 30, 5, 15 ] );
				translate( [ 5, 5 + 10, 15 / 2 ] )
					rotate( [ 90, 0, 0 ] ){
						cylinder( r = 2, h = 5 + 10.1, $fn = 20 );
						cylinder( h = 5 - 2.3 + 10, r = 6.1 / 2, $fn=6 );
					}
				translate( [ 30 - 5, 5 + 10, 15 / 2 ] )
					rotate( [ 90, 0, 0 ] ){
						cylinder( r = 2, h = 5 + 10.1, $fn = 20 );
						cylinder( h = 5 - 2.3 + 10, r = 6.1 / 2, $fn=6 );
					}
			}
		translate ( [ -15, -basis_height, 5 * 24 / 2 - 15 / 2 + 70 / 2 ] )
			difference() {
				cube( [ 30, 5, 15 ] );
				translate( [ 5, 5 + 10, 15 / 2 ] )
					rotate( [ 90, 0, 0 ] ){
						cylinder( r = 2, h = 5 + 10.1, $fn = 20 );
						cylinder( h = 5 - 2.3 + 10, r = 6.1 / 2, $fn=6 );
					}
				translate( [ 30 - 5, 5 + 10, 15 / 2 ] )
					rotate( [ 90, 0, 0 ] ){
						cylinder( r = 2, h = 5 + 10.1, $fn = 20 );
						cylinder( h = 5 - 2.3 + 10, r = 6.1 / 2, $fn=6 );
					}
			}
	}

	translate( [ 0, 0, -0.1 ] )
		cylinder( r = 7.5, h = 5 * 24 + 0.2, $fn = 50 );
	translate( [ 0, -0.5, -0.1 ] )
		cylinder( r = 7.5, h = 5 * 24 + 0.2, $fn = 50 );
}