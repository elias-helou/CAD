inner_rad = 34.465 / 2 - 0.2;
outer_rad = inner_rad + 10;
ring_rad = 7;

render( convexity = 10 ) {

    difference () {
        union() {
            cylinder( r = inner_rad, h = 20, $fn = 50 );
            cylinder( r = outer_rad, h = 7, $fn = 50 );
        }
        translate( [ -2.5, 0, 0 ] )
            rotate ( 90, [ 0, 1, 0 ] )
                difference () {
                    cylinder( r = 7, h = 5, $fn = 50 );
                    translate( [ 0, 0, -1 ] )
                        cylinder( r = 4, h = 7, $fn = 50 );
                }
    }
}