h = 13;
s = 5;
del_s = 3;
r = s / 2 + 2;

del_r = 5;

h_ring = 4;
w_ring = 2.5;

del_h = 2;

render( convexity = 10 ) {

    translate( [ -del_s , -del_s, 0] )
        cube( [ s + 3 * del_s, s + 2 * del_s, 4 ] );
    difference(){
        cube( [ s + del_s, s, h ]  );
        translate( [ -1, s / 2, h + del_h ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( r = r, h = s + del_s + 2, $fn = 20 );
        
        // ring
        translate( [ ( s + del_s - h_ring ) / 2, s/2, h + del_h ] )
        rotate( 90, [ 0, 1, 0 ] )
        difference(){
            cylinder( r = r + del_r, h = h_ring, $fn = 20 );
            translate( [ 0, 0, -1 ] )
            cylinder( r = r + del_r - w_ring, h = h_ring + 2, $fn = 20 );
        }
    }
}