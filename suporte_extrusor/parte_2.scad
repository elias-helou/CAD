module base () {

	difference () {
		cube( [ 35, 9, 14 ] );
		translate( [ -0.1, 3, 4.1 ] )
			cube( [ 35.2, 3, 14.1 ] );		
	}
	difference () {
		cube( [ 35, 50 + 4 * 1.42, 4 ] );
		translate ( [ 10, 0, -0.1 ] )
			cube( [ 15, 40, 4.3 ] );
		translate ( [ 10, 50, -0.1 ] )
			cube( [ 15, 26, 4.3 ] );
		translate( [ 17.5, 50.3 + 2 * 1.42, 0 ] )
			rotate( [ 135, 0, 0 ] )
				cube( [ 15, 50, 4 ], center = true );
		translate( [ 4, 10, -0.1 ] )
			cube( [ 2, 3.8, 4.2 ] );
		translate( [ 29, 10, -0.1 ] )
			cube( [ 2, 3.8, 4.2 ] );
	}
}

module hipotenusa () {

	difference (){
		translate( [ 0, 0, 34 ] )
			cube( [ 35, 9, 13 ] );
		translate( [ -0.1, 3, 33.9 ] )
			cube( [ 35.2, 3, 10.1 ] );
	}

	difference (){
		translate( [ 0, 50.3 + 4 * 1.42, 0 ] )
			rotate( [ 135, 0, 0 ] )
			difference () {
				translate( [ 0, -5, 0 ] )
					cube( [ 35, 46 * 1.42 + 6.1, 4 ] );
				translate( [ 10, 15, -0.1 ] )
					cube( [ 15, 46 * 1.42 + 6.1 - 30, 4.2 ] );
				translate( [ 4, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 - 1.9, -0.1 ] )
					cube( [ 2, 3.8, 4.2 ] );
				translate( [ 29, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 - 1.9, -0.1 ] )
					cube( [ 2, 3.8, 4.2 ] );
				translate( [ 25, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 - 1.9, -0.1 ] )
					cube( [ 4, 3.8, 1 ] );
				translate( [ 6, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 - 1.9, -0.1 ] )
					cube( [ 4, 3.8, 1 ] );
				translate( [ 35 / 2 + 23 / 2, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 + 23 / 2, -0.1 ] )
					cylinder( r = 2, h = 4.2, $fn = 20 );
				translate( [ 35 / 2 + 23 / 2, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 - 23 / 2, -0.1 ] )
					cylinder( r = 2, h = 4.2, $fn = 20 );
				translate( [ 35 / 2 - 23 / 2, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 + 23 / 2, -0.1 ] )
					cylinder( r = 2, h = 4.2, $fn = 20 );
				translate( [ 35 / 2 - 23 / 2, 15 + ( 46 * 1.42 + 6.1 - 30 )/ 2 - 23 / 2, -0.1 ] )
					cylinder( r = 2, h = 4.2, $fn = 20 );
			}
		base();
	}
}

//base();
//rotate( [ -135, 0, 0 ] )
//	color( [ 0, 0, 1 ] ) hipotenusa();
base();
//color( [ 1, 0, 0 ] ) base();
//hipotenusa();

//translate( [ -5, 3, 4 ] )
//	color( [ 0, 0, 0 ] ) cube( [ 100, 3, 40 ] );