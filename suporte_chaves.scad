N = 5;
dist = 3;
d = 8.5;
tol = 0.5;

blck_l = N * ( d + tol ) + ( N + 1 ) * dist;
blck_w = 2 * dist + d + tol;
blck_h = 15;

difference(){
    cube( [ blck_l, blck_w, blck_h ] );

    for ( i = [ 0 : N - 1 ] ) {
        translate( [ dist + 0.5 * ( d + tol ) + i * ( dist + d + tol ), 0.5 * blck_w + 2, 2 ] )
        rotate( 10, [ 1, 0, 0 ] )
            cylinder( d = d + tol, h = 2 * blck_h, $fn = 50 );
    }
}
