l_base = 54;
d_base = 5;
a_paredes = 3;
tol = 0.5;
l_total = 55;

difference()
{
    union(){
        cube( [ l_base + 2 * a_paredes + 2 * tol, l_total, a_paredes ] );
        
        cube( [ a_paredes, l_total, 2 * a_paredes + d_base ] );
        translate( [ l_base + a_paredes + 2 * tol, 0, 0 ] ) {
            cube( [ a_paredes, l_total, 2 * a_paredes + d_base ] );
        }
        
        d_lombada = a_paredes * 1.5;
        
        x_dis = 0.5 * sqrt( d_lombada ^ 2 - ( a_paredes ) ^ 2 );
        
        translate( [ a_paredes - x_dis, 0, 2 * a_paredes + d_base - d_lombada / 2 + d_lombada / 2 - a_paredes / 2 ] )
            rotate( 90, [ -1, 0, 0 ] )
                cylinder( d = d_lombada, h = l_total, $fn = 100 );
        
        translate( [ l_base + 2 * a_paredes + 2 * tol - ( a_paredes - x_dis ), 0, 2 * a_paredes + d_base - d_lombada / 2 + d_lombada / 2 - a_paredes / 2 ] )
            rotate( 90, [ -1, 0, 0 ] )
                cylinder( d = d_lombada, h = l_total, $fn = 100 );
    }
    
    translate( [ l_base / 2 + a_paredes + tol, l_total / 2, -1 ] )
        cylinder( d = l_base - 5, h = a_paredes + 2, $fn = 100 );
}