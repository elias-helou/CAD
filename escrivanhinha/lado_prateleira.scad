w = 45;
l = 15;
h = 15;
strap_h = 3;
strap_w = 7;
strap_inset = 1;

head_d = 9;
body_d = 5;
hole_dist = 20;
hole_inset = 4;

difference(){
    cube( [ w, l, h ] );
    
    translate( [ w / 2 - strap_w / 2, -1, strap_inset ] )
        cube( [ strap_w, l + 2, strap_h ] );    
    
    translate( [ w / 2 - hole_dist / 2, l / 2, -1 ] )
        cylinder( d = body_d, h = h + 2, $fn = 50 );
    translate( [ w / 2 - hole_dist / 2, l / 2, h - hole_inset ] )
        cylinder( d = head_d, h = h + 2, $fn = 50 );

    translate( [ w / 2 + hole_dist / 2, l / 2, -1 ] )
        cylinder( d = body_d, h = h + 2, $fn = 50 );
    translate( [ w / 2 + hole_dist / 2, l / 2, h - hole_inset ] )
        cylinder( d = head_d, h = h + 2, $fn = 50 );
    
    translate( [ 0, 0, h / 2 ] )
        rotate( 45, [ 0, 1, 0 ] )
            translate( [ -100, -1, 0 ] )
                cube( [ 100, 100, 100 ] );
}
