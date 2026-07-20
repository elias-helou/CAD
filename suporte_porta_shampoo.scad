l = 107;
h = 14;
w = 22;
h_dist = 50;
h_up = 4;
r = 1;
r_d = 5;
r_up = 4;
he_room = 7;
he_d = 8;
cap_room = 1;
cap_d = he_d + 4;
fn = 40;

difference(){
    translate( [ r - l / 2, r - w  / 2, r ] ){
        minkowski(){
            cube( [ l - 2 * r, w - 2 * r, h - 2 * r ] );
            sphere( r = r, $fn = fn );
        }
    }
    
    translate( [ -h_dist / 2, h_up, -1 ] )
        cylinder( d = 5, $fn = fn, h = 100 );
    translate( [ -h_dist / 2, h_up, h - he_room ] )
        cylinder( h = 100, d = he_d, $fn = fn );
    translate( [ -h_dist / 2, h_up, h - cap_room ] )
        cylinder( h = 100, d = cap_d, $fn = fn );


    translate( [ h_dist / 2, h_up, -1 ] )
        cylinder( d = 5, $fn = fn, h = 100 );
    translate( [ h_dist / 2, h_up, h - he_room ] )
        cylinder( h = 100, d = he_d, $fn = fn );
    translate( [ h_dist / 2, h_up, h - cap_room ] )
        cylinder( h = 100, d = cap_d, $fn = fn );
    
    translate( [ 0, -r_up, r_d / 2 + 5 ] )
        rotate( 90, [ 0, 1, 0 ] )
            translate( [ 0, 0, -250 ] )
                cylinder( d = r_d, h = 500, $fn = fn );translate( [ -250, -r_d / 2 - r_up, -50 + r_d / 2 + 5 ] )
        cube( [ 500, r_d, 50 ] );
}
