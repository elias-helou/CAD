l = 113;
r = 9.3;
h = 4;
del = 4;

difference() {
    union() {
        translate( [ 0, 0, 1 ] )
        {
            cube( [ l, 2 * r, h - 1 ] );
            translate( [ 0, r, 0 ] )
                cylinder( r = r, h = h - 1, $fn = 20 );
        }
        translate( [ 0, -del, 0 ] )
            cube( [ l, 2 * ( r + del ), h / 2 ] );
        translate( [ 0, r, 0 ] )
            cylinder( r = r + del, h = h / 2, $fn = 20 );
    }
//    translate( [ 0, r, -1 ] )
//    {
//        #cylinder( r = 4, h = 15, $fn = 20 );
//        translate( [ -15, -4, 0 ] )
//            #cube( [ 15, 8, 10 ] );
//    }

    translate( [ 90, 11, 0 ] )
    rotate( -90, [ 0, 0, 1 ] )
        translate( [ 0, r, -1 ] )
        {
            cylinder( r = 4, h = 15, $fn = 20 );
            translate( [ -15, -4, 0 ] )
                cube( [ 15, 8, 10 ] );
        }
}