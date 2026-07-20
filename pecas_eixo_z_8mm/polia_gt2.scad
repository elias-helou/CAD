inner_rad = 6.5;
wall_thick = 0.8;
tab_height = 1.8;
tab_width = 1;
wall_height = 3.75;

difference(){
    union(){
        cylinder( r = inner_rad + 0.8, h = wall_height + tab_width, $fn = 50 );
        cylinder( r = inner_rad + 0.8 + tab_height, h = tab_width, $fn = 50 );
    }
    translate( [ 0, 0, wall_height + tab_width - 3 ] )
        cylinder( r = inner_rad, h = wall_height + tab_width, $fn = 50 );

    translate( [ 0, 0, -1 ] )
        cylinder( r = 5.5, h = wall_height + tab_width, $fn = 50 );
}
