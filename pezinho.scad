
difference(){
    union(){
        cylinder( h = 20, r = 5, $fn = 100 );
        cylinder( h = 12, r = 16, $fn = 100 );
    }
    rotate_extrude( $fn = 100 )
        translate( [ 15, 12, 0 ] )
            #circle( 10, $fn = 50 );
    translate( [ 0, 0, -1 ] )
        cylinder( h = 22, r = 2, $fn = 100 );
}
