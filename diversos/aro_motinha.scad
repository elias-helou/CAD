difference (){
	union () {
		difference (){
			union(){
				cylinder( h = 4.6, r = 14.4, $fn = 100 );
				cylinder( h = 1.0, r = 16.0, $fn = 100 );
			}
			translate ( [ 0, 0, 1.0 ] )
				cylinder( h = 4.6, r = 12.4, $fn = 100 );
		}
		difference (){
			cylinder( h = 3.0, r = 4.5, $fn = 100 );
			translate ( [ 0, 0, 1.0 ] )
				cylinder( h = 3.0, r = 3.0, $fn = 100 );
		}
	}
	translate ( [ 0, 0, -1.0 ] )
		cylinder( h = 3.0, r = 1.4, $fn = 100 );
	for ( i = [ 0, 1, 2, 3, 4 ] ) {
		rotate ( [ 0, 0, 360 / 5 * i ] )
			translate ( [ 8.5, 0, -1.0 ] )
				cylinder( h = 3.0, r = 3.9, $fn = 100 );
	}
}
