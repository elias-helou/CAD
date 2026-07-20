difference(){
    cylinder( r2 = 17.5, r1 = 35, h = 20, $fn = 100 );
    translate( [ 0, 0, -1 ] )
        cylinder( r = 6, h = 22, $fn = 100 );
}
