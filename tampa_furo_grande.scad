l = 119.6;
r = 9.3;
h = 4;
del = 4;
cut_length = 14;
cut_width = 2.9;

rotate( 180, [ 1, 0, 0 ] )
difference(){

    translate( [ 0, r, 0 ] )
    rotate( 180, [ 1, 0, 0  ] )
    translate( [ 0, -r, 0 ] )
    union(){
        translate( [ 0, 0, 1 ] )
        {
            cube( [ l, 2 * r, h - 1 ] );
            translate( [ 0, r, 0 ] )
                cylinder( r = r, h = h - 1, $fn = 100 );
        }
        
        translate( [ 0, -del, 0 ] )
            cube( [ l, 2 * ( r + del ), h / 2 ] );
        translate( [ 0, r, 0 ] )
            cylinder( r = r + del, h = h / 2, $fn = 100 );
    }

    translate( [ l - 40, 11, -6 ] )
        rotate( -90, [ 0, 0, 1 ] )
            translate( [ 0, 0, -1 ] )
            {
                cylinder( r = 4, h = 15, $fn = 100 );
                translate( [ -15, -4, 0 ] )
                    cube( [ 15, 8, 10 ] );
            }
            
    translate( [ l - cut_length, r - cut_width / 2, -6 ] )   
        cube( [ cut_length + 1, cut_width, 20 ] );
            
    translate( [ l - 63, r, -6 ] )
        cylinder( h = 20, r = 2, $fn = 100 );
}
