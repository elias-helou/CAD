d_small = 17.5;
d_large = 20;
h = 15;
wall = 2;
lin_rate = ( d_large - d_small ) / h;
tilt = -10;

difference(){
    union(){
        rotate( tilt, [ 1, 0, 0 ] )
            cylinder( d1 = d_small + 2 * wall, d2 = d_large + 2 * wall, h = h, $fn = 100 );
        rotate( -90, [ 0, 0, 1 ] )
        {
            translate( [ d_small / 2.0 - 1, -5, 1.7 ] )
            {
                cube( [ 30, 10, h ] );
                translate( [ 25, -( d_large / 2 + wall ) + 5, 0 ] )
                    cube( [ 5, d_large + 2 * wall, h ] );
            }
        }
    }
    rotate( tilt, [ 1, 0, 0 ] )
        translate( [ 0, 0, -1 ] )
            cylinder( d1 = d_small - lin_rate, d2 = d_large + lin_rate, h = h + 2, $fn = 100 );
    rotate( tilt, [ 1, 0, 0 ] )
        rotate( 45, [ 0, 0, 1 ] )
            translate( [ -1, -1, -50 ] )
                cube( [ 100, 100, 100 ] );
    translate( [ -50, -50, h + 1.7 - 0.01 ] )
        cube( [ 100, 100, 100 ] );
}
