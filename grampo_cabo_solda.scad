d = 6.7;
wall = 1.8;

difference(){
    union(){
        cylinder( d = d + 2 * wall, h = 10, $fn = 100 );
        translate( [ -2.5, 0, 0 ] )
            cube( [ 5, d / 2 + wall + 5, 10 ] );
        translate( [ -( d / 2 + wall ), d / 2 + wall + 5 - 2.5, 0 ] )
            cube( [ d + 2 * wall, 2.5, 10 ] );
    }
    translate( [ 0, 0, -1 ] )
        cylinder( d = d, h = 12, $fn = 100 );
   rotate( -135, [ 0, 0, 1 ] )
       translate( [ 0, 0, -1 ] )
            cube( [ 100, 100, 100 ] );
}