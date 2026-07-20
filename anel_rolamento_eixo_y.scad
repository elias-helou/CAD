d = 22 + 0.;
w = 1.5;
bw = 1.0;
h = 7;
l = 5;

difference(){
    cylinder( d = d + 2 * w, h = h / 2 + w, $fn = 100 );
    translate( [ 0, 0, -1 ] )
        cylinder( d = d, h = h / 2 + w + 2, $fn = 100 );
}
difference(){
    cylinder( d = d + 2 * ( w + l ), h = bw, $fn = 100 );
    translate( [ 0, 0, -1 ] )
        cylinder( d = d - 2 * w, h = bw + 2, $fn = 100 );
}
