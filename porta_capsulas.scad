l_base = 55;
d_base = 5;
a_paredes = 3;
tol = 0.5;

cube( [ l_base + 2 * a_paredes + 2 * tol, 10, a_paredes ] );

cube( [ a_paredes, 10, 2 * a_paredes + d_base ] );
translate( [ l_base + a_paredes + 2 * tol, 0, 0 ] ) {
    cube( [ a_paredes, 10, 2 * a_paredes + d_base ] );
}

d_lombada = a_paredes * 1.5;

x_dis = 0.5 * sqrt( d_lombada ^ 2 - ( a_paredes ) ^ 2 );

translate( [ a_paredes - x_dis, 0, 2 * a_paredes + d_base - d_lombada / 2 + d_lombada / 2 - a_paredes / 2 ] )
    rotate( 90, [ -1, 0, 0 ] )
        cylinder( d = d_lombada, h = 10, $fn = 100 );

translate( [ l_base + 2 * a_paredes + 2 * tol - ( a_paredes - x_dis ), 0, 2 * a_paredes + d_base - d_lombada / 2 + d_lombada / 2 - a_paredes / 2 ] )
    rotate( 90, [ -1, 0, 0 ] )
        cylinder( d = d_lombada, h = 10, $fn = 100 );
