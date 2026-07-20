od = 60;
id = 50;

wt = 5;

hd = 9.5;
hh = 4.3;
hi = 2;
sd = 4.5;

ss = 30;
st = 10;

wa = 45;
wtr = 5;

hdist = 3;

module torus( r1, r2 ){
    rotate_extrude( convexity = 10, $fn = $fn )
        translate( [ r2, 0, 0 ] )
            circle( r = r1, $fn = $fn );
}


difference(){
    cylinder( h = st, d = od + 2 * wt, $fn = 50 );

    translate( [ -50, -( ( od + 2 * wt ) / 2 - ss ) , -1 ] )
        cube( [ 100, 100, 100 ] );
    
    torus( ( od - id ) / 2, ( od + id ) / 4, $fn = 50  );
    
    translate( [ -wtr, 0, 0 ] )
        rotate( wa, [ 0, 0, 1 ] )
            translate( [ -50, 0, -1 ] )
                cube( [ 100, 100, 100 ] );
    translate( [ wtr, 0, 0 ] )
        rotate( -wa, [ 0, 0, 1 ] )
            translate( [ -50, 0, -1 ] )
                cube( [ 100, 100, 100 ] );
    
    translate( [ 0, -( hd + 0.6 ) - hdist, -1 ] )
        cylinder( d = sd + 0.6, h = st + 2, $fn = 50 );
    translate( [ 0, -( hd + 0.6 ) - hdist, st - hh - hi ] )
        cylinder( d2 = hd + 0.6, d1 = sd + 0.6, h = hh, $fn = 50 );
    translate( [ 0, -( hd + 0.6 ) - hdist, st - hi ] )
        cylinder( d = hd + 0.6, h = st, $fn = 50 );
}
