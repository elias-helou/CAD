height = 7 + 4 + 4;

difference(){
    union(){
        cylinder( h = height, r = 3.5, $fn = 50 );
    
        translate( [ 0, -3.5, 0 ] )
            cube( [ 30, 7, height ] );
    
        translate( [ 30, 0, 0 ] )
            cylinder( h = height, r = 3.5, $fn = 50 );
    }
    
    translate( [ 0, 0, -1 ] )
        cylinder( h = height + 2, r = 1.8, $fn = 50 );

    translate( [ 30, 0, -1 ] )
        cylinder( h = height + 2, r = 1.8, $fn = 50 );

    translate( [ -5, -5, ( height - 7.4 ) / 2 ] )
        cube( [ 10, 10, 7.4 ] );

    translate( [ 25, -5, ( height - 3.4 ) / 2 ] )
        cube( [ 10, 10, 3.4 ] );

    translate( [ 25, -5, ( height - 3.4 ) / 2 + 3.4 + 2.8 ] )
        cube( [ 10, 10, 3.4 ] );

    translate( [ 25, -5, ( height - 3.4 ) / 2 - 3.4 - 2.8 ] )
        cube( [ 10, 10, 3.4 ] );
    
    translate( [ 7.5, -5, 4 ] )
        cube( [ 15, 10, height - 8 ] );
}