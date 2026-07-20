h = 10;
ch= 5;
eh = 2;
hh = 2.5;
cl = 5;
th = 1;


difference()
{
    union(){
        translate( [ -10, 0, 0 ] )
            cube( [ 20, 10 + cl, ch ] );
        
        cylinder( d = 20, $fn = 50, h = ch );
        translate( [ 0, cl + 10, 0 ] )
            cylinder( d = 20, $fn = 50, h = ch );
        
        translate( [ 0, 0, ch - 1e-3 ] )
            cylinder( d1 = 20 - 1e-3, d2 = 7.6 + 1.6 * 2, $fn = 50, h = h - ch + 1e-3 + eh + hh );
    }
    
    translate( [ 0, 0, h + hh ] )
        cylinder( d = 8.5, h = 100, $fn = 50 );
    
    translate( [ 0, 0, -1 ] )
        cylinder( d = 4.8, h = 100, $fn = 50 );
    
    translate( [ 0, 0, -1 ] )
        cylinder( d = 8, h = hh + 1, $fn = 50 );

    translate( [ 0, 0, hh - 1e-3 ] )
        cylinder( d1 = 8, d2 = 4.8, h = th + 1e-3, $fn = 50 );

    translate( [ 0, cl + 10 + 3, -1 ] )
        cylinder( d = 5, $fn = 50, h = 100 );
}
