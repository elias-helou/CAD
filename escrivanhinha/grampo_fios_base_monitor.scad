w = 70;
l = 12;
h = 7;
strap_h = 3;
strap_w = 7;
strap_inset = 1;

screw_d = 30;
screw_head = 8.5;

//head_d = 9;
//body_d = 5;
hole_dist = 5;
//hole_inset = 4;

difference(){
    cube( [ w, l, h ] );
    
    translate( [ hole_dist, -1, strap_inset ] )
        cube( [ strap_w, l + 2, strap_h ] );    
    
    translate( [ w - hole_dist - strap_w, -1, strap_inset ] )
        cube( [ strap_w, l + 2, strap_h ] );        
    translate( [ w / 2 - screw_d / 2, l / 2, -1 ] )
        cylinder( d = 4.1, h = h + 2, $fn = 50 );
    translate( [ w / 2 - screw_d / 2, l / 2, h - 3 ] )
        cylinder( d = screw_head, h = h + 2, $fn = 50 );
    translate( [ w / 2 + screw_d / 2, l / 2, -1 ] )
        cylinder( d = 4.1, h = h + 2, $fn = 50 );
    translate( [ w / 2 + screw_d / 2, l / 2, h - 3 ] )
        cylinder( d = screw_head, h = h + 2, $fn = 50 );
}
