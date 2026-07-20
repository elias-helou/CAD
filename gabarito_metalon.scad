//w = 25;
w_x = 30;
w_y = 50;
h = 10;
t = 3;

angle = 45;

font = "Liberation Sans";
letter_height = 1;
letter_size_factor_angle = 0.6;
letter_size_factor_y = 1;
letter_size_factor_x = 0.9;

difference() {
    
    union(){
        cube( [ w_x + 2 * t, w_y + 2 * t, h + ( w_y + 2 * t ) * tan( angle ) ] );
        
        translate( [ w_x + t, ( w_y + 2 * t ) / 2, h ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( d = 8, h = 2 * t, $fn = 50 );
    }
        
    translate( [ t, t, -1 ] )
        cube( [ w_x + 0.5, w_y + 0.5, h + ( w_y + 2 * t ) * tan( angle ) + 2 ] );
    
    translate( [ -1, 0, h ] )
        rotate( angle, [ 1, 0, 0 ] )
            cube( [ 500, 500, 500 ] );    
    
    translate( [ ( w_x + 2 * t ) / 2, letter_height, h / 2 ] )
        rotate( 90, [ 1, 0, 0 ] )
            letter( str( angle, "°" ), letter_size_factor_angle );
    translate( [ letter_height, ( w_y + 2 * t ) / 2, h * letter_size_factor_y / 2 + 2 ] )
        rotate( -90, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
            letter( str( w_y, "mm" ), letter_size_factor_y );
    translate( [ ( w_x + 2 * t ) / 2, w_y + 2 * t - letter_height, , h * letter_size_factor_x / 2 + 2 ] )
        rotate( 180, [ 0, 0, 1 ] ) rotate( 90, [ 1, 0, 0 ] )
            letter( str( w_x, "mm" ), letter_size_factor_x );

    translate( [ w_x + t - 1, ( w_y + 2 * t ) / 2, h ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d = 4, h = 2 * t + 2, $fn = 50 );
}


module letter( l, letter_size_factor = 1 ) {
	linear_extrude( height = letter_height + 0.1 ) {
		text( l, size = h * letter_size_factor, font = font, halign = "center", valign = "center", $fn = 50 );
	}
}
