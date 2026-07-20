wall = 4;
washer_d = 10;
thread_d = 5;
tol = 0.6;
//width = 5.4;
//height = 8.2;
width = 8.2;
height = 5.4;
length = 5;
base_width = 2 * height + 2 * 11;
hole_d = 3.5;

// delta = -( wall / 4 );
delta = 0;

del = -1e-3;

module box(){
    difference(){
    translate( [ 0, delta, -length ] )
        cylinder( d = washer_d + wall, h = 4 + length, $fn = 50 );
        translate( [ 0, del, -length + 1  ] )
            cube( [ width + tol, height + tol, 2 * length ], center = true );
    }
}

difference(){
    box();
    translate( [ 0, del, -length - 1 ] )
        cylinder( d = thread_d + tol, h = 4 + length + 2, $fn = 50 );
}

difference(){
    translate( [ -base_width / 2, ( height + tol ) / 2, -length ] )
        cube( [ base_width, wall / 2 + ( washer_d - height ) / 2 - tol / 2, length + 4 ] );
    
    translate( [ -12, 50, -( length - 4 ) / 2 ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( d = hole_d + tol, h = 100, $fn = 50 );
    translate( [ 12, 50, -( length - 4 ) / 2 ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( d = hole_d + tol, h = 100, $fn = 50 );
}
