height = 7 + 2;
length = 17;
angle = 180 - 62;
thick = 6;

difference(){
    union(){
        rotate( angle, [ 0, 0, 1 ] ) {
            difference(){
                translate( [ 0, - thick / 2, 0 ] )
                    cube( [ 15, thick, height ] );
                translate( [ 15 / 2, thick / 2 + 0.1, height / 2 ] )
                    rotate( 90, [ 1, 0, 0 ] )
                        cylinder( h = thick + 0.2, r = 4 / 2 + 1, $fn = 50 );
            }
        }
        cylinder( h = height, r = thick / 2, $fn = 50 );
    
        translate( [ 0, -thick / 2, 0 ] )
            cube( [ length, thick, height ] );
    
        translate( [ length, 0, 0 ] )
            cylinder( h = height, r = 3.5, $fn = 50 );
    }
    
    translate( [ length, 0, -1 ] )
        cylinder( h = height + 2, r = 1.8, $fn = 50 );
    translate( [ length - 5, -5, ( height - 3.4 ) / 2 ] )
        cube( [ 10, 10, 3.4 ] );
}
