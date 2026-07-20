w = 14;
l = 33;

w_tol = 0.6;
l_tol = 0.6;
h_tol = 0.2;

wall = 2.0;
top_wall = 2.0;

connector_insert = 4;
connector_w = 12;

h_board = 1.1;
h_controller = 1.5;
h_memory = 1.0;

h = h_board / 2 + h_controller;

hole_d = 2;

controller_dist = 15;
w_controller = 7;
l_controller = 7;

font = "Liberation Sans";
letter_height = 1;

difference(){
    union(){
        cube( [ w + 2 * wall, l + 2 * wall, h + top_wall ] );
        
        translate( [ 0, ( hole_d + w_tol + wall ) / 2, 0 ] )
            cylinder( d = hole_d + w_tol + wall, h = h + top_wall, $fn = 50 );
        translate( [ w + 2 * wall, ( hole_d + w_tol + wall ) / 2, 0 ] )
            cylinder( d = hole_d + w_tol + wall, h = h + top_wall, $fn = 50 );
        translate( [ 0, l + 2 * wall - ( hole_d + w_tol + wall ) / 2, 0 ] )
            cylinder( d = hole_d + w_tol + wall, h = h + top_wall, $fn = 50 );
        translate( [ w + 2 * wall, l + 2 * wall - ( hole_d + w_tol + wall ) / 2, 0 ] )
            cylinder( d = hole_d + w_tol + wall, h = h + top_wall, $fn = 50 );

        translate( [ 0, 1, 0 ] )
            difference(){
                translate( [ ( w + 2 * wall ) / 2, 0, 0 ] )
                    cylinder( d = 0.8 * ( w + 2 * wall ), h = h + top_wall, $fn = 50 );
                translate( [ ( w + 2 * wall ) / 2, 0, -1 ] )
                    cylinder( d = 0.75 * ( w + 2 * wall ) - 3 * wall, h = h + top_wall + 2, $fn = 50 );
            }
    }

    
    translate( [ wall - w_tol / 2, wall - l_tol / 2, -1 ] )
        cube( [ w + w_tol, l + l_tol, h + h_tol + 1 ] );
    
    translate( [ ( w + 2 * wall - ( connector_w + w_tol ) ) / 2, l + wall - ( connector_insert + l_tol / 2 ), -50 ] )
        cube( [ connector_w + w_tol, 100, 100 ] );
    
    translate( [ ( w + 2 * wall - ( w_controller - wall ) ) / 2, controller_dist + wall, -1 ] )
        cube( [ w_controller - wall, l_controller - wall, 100 ] );

        translate( [ 0, ( hole_d + w_tol + wall ) / 2, -1 ] )
            cylinder( d = hole_d + w_tol, h = h + top_wall + 2, $fn = 50 );
        translate( [ w + 2 * wall, ( hole_d + w_tol + wall ) / 2, -1 ] )
            cylinder( d = hole_d + w_tol, h = h + top_wall + 2, $fn = 50 );
        translate( [ 0, l + 2 * wall - ( hole_d + w_tol + wall ) / 2, -1 ] )
            cylinder( d = hole_d + w_tol, h = h + top_wall + 2, $fn = 50 );
        translate( [ w + 2 * wall, l + 2 * wall - ( hole_d + w_tol + wall ) / 2, -1 ] )
            cylinder( d = hole_d + w_tol, h = h + top_wall + 2, $fn = 50 );
    
    translate( [ ( w + 2 * wall ) / 2, 5, h + top_wall - letter_height ] )
        letter( "UP" );
}


module letter( l ) {
	linear_extrude( height = letter_height + 0.1 ) {
		text( l, size = 5, font = font, halign = "center", valign = "center", $fn = 50 );
	}
}
