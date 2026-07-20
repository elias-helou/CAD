inner_rad = 6.5;
wall_thick = 0.8;
tab_height = 1.3;
tab_width = 2.5;

difference(){
    union(){
        cylinder( r = inner_rad + wall_thick, h = 6 + tab_height, $fn = 50 );
        cylinder( r = inner_rad + wall_thick + tab_width, h = tab_height, $fn = 50 );
    }
    translate( [ 0, 0, -( 7.5 + tab_height - 5 ) ] )
        cylinder( r = inner_rad + 0.2, h = 7.5 + tab_height, $fn = 50 );
    translate( [ 0, 0, +1 ] )
        cylinder( r = inner_rad - 2, h = 7.5 + tab_height, $fn = 50 );
}
