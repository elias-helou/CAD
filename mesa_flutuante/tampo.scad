module ring( h, i_r, o_r, $fn = 20 )
{
    difference() {
        cylinder( h = h, r = o_r, $fn = $fn );
        translate( [ 0, 0, -1 ] )
            cylinder( h = h + 2, r = i_r, $fn = $fn );
    }
}

R = 75;

N_rings = 5;
W_ring = R / ( N_rings * 2 ) * 0.9;
W_empty = R / N_rings - W_ring;

height = 4;

for( i = [ 1 : N_rings ] ) {
    ring( h = height, o_r = i / N_rings * R, i_r = i / N_rings * R - W_ring, $fn = 100 );
}

N_spokes = 6;

for( i = [ 1 : N_spokes ] ) {
    rotate( 180 / N_spokes * ( i - 1 ), [ 0, 0, 1 ] )
    {
        translate( [ -W_ring / 2, -W_empty - W_ring / 2 - ( R - W_empty - W_ring ), 0 ] )
            cube( [ W_ring, R - W_empty - W_ring, height ] );
        translate( [ -W_ring / 2, W_empty + W_ring / 2, 0 ] )
            cube( [ W_ring, R - W_empty - W_ring, height ] );
    }
}
