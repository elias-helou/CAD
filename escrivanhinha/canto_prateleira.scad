w = 15;
l = 45;
h = 15;
strap_h = 3;
strap_w = 7;
strap_inset = 1;

head_d = 9;
body_d = 5;
hole_dist = 2;
hole_inset = 3;

groove_l = w + 7;
groove_h = 2;

difference() {
    // Corpo principal
    union() {
        cube( [ w, l, h ] );
        cube( [ l, w, h ] );
    }
    
    // Cavado para solda no canto:
    translate( [ -1, -1, -1 ] )
        cube( [ groove_l + 1, groove_l + 1, groove_h + 1 ] );
    
    // Furos para parafusos:
    translate( [ w / 2, l - head_d / 2 - hole_dist, -1 ] )
        cylinder( d = body_d, h = h + 2, $fn = 50 );
    translate( [ w / 2, l - head_d / 2 - hole_dist, hole_inset - h ] )
        cylinder( d = head_d, h = h, $fn = 50 );

    translate( [ l - head_d / 2 - hole_dist, w / 2, -1 ] )
        cylinder( d = body_d, h = h + 2, $fn = 50 );
    translate( [ l - head_d / 2 - hole_dist, w / 2, hole_inset - h ] )
        cylinder( d = head_d, h = h, $fn = 50 );

    translate( [ w / 2, w / 2, -1 ] )
        cylinder( d = body_d, h = h + 2, $fn = 50 );
    translate( [ w / 2, w / 2, hole_inset - h + groove_h ] )
        cylinder( d = head_d, h = h, $fn = 50 );

    // Furos para amarras:
    translate( [ l - strap_w - head_d - 2 * hole_dist, -1, h - strap_h - strap_inset ] )
        cube( [ strap_w, l + 2, strap_h ] );    


    translate( [ -1, l - strap_w - head_d - 2 * hole_dist,  h - strap_h - strap_inset ] )
        cube( [ l + 2, strap_w, strap_h ] );    
}