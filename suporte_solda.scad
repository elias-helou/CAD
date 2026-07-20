d = 18.5;
h = 15;
wall = 2;

difference(){
    union(){
        translate( [ 0, -5, 0 ] )
            cube( [ d / 2 + 15, 10, h ] );
        cylinder( d = d + 2 * wall, h = h, $fn = 100 );
        translate( [ d / 2 + 15 - 5, -11, 0 ] )
            cube( [ 5, 22, h ] );
    }
    
    translate( [ 0, 0, -1 ] )
        cylinder( d = d, h = h + 2, $fn = 100 );
    
    rotate( 90, [ 0, 0, 1 ] )
        translate( [ 0, 0, -1 ] )
            cube( [ 100, 100, 100 ] );
}
