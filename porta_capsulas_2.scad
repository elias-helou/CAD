l_base = 54;

a_paredes = 3;
l_paredes = 3;

l_braco = 5;


d_gancho = 3.35;
l_gancho = l_braco;
p_gancho = 4;
a_gancho = 270;

module gancho() {
    rotate( -90, [ 0, 1, 0 ] )
    rotate( ( 360 - a_gancho ) / 2, [ 0, 0, 1 ] )
        rotate_extrude( angle = a_gancho, $fn = 64 )
            translate( [ d_gancho / 2, 0 ] )
                square( [ p_gancho / 2, l_gancho ] );
}

del_gancho = 0.8;

translate( [ l_base / 2, l_base / 2 - del_gancho, d_gancho / 2 + a_paredes ] )
    gancho();
translate( [ l_base / 2, -l_base / 2 + del_gancho, d_gancho / 2 + a_paredes ] )
    gancho();
translate( [ -l_base / 2 + l_gancho, l_base / 2 - del_gancho, d_gancho / 2 + a_paredes ] )
    gancho();
translate( [ -l_base / 2 + l_gancho, -l_base / 2 + del_gancho, d_gancho / 2 + a_paredes ] )
    gancho();

difference()
{
    union(){
        cylinder( d = l_base, h = a_paredes, $fn = 100 );
        translate( [ -l_base / 2, -l_base / 2 - d_gancho * 0.8 + del_gancho, 0 ] )
            cube( [ l_braco, l_base + d_gancho * 1.6 - 2 * del_gancho, a_paredes ] );
        translate( [ l_base / 2 - l_braco, -l_base / 2 - d_gancho * 0.8 + del_gancho, 0 ] )
            cube( [ l_braco, l_base + d_gancho * 1.6 - 2 * del_gancho, a_paredes ] );
    }
    translate( [ 0, 0, -1 ] )
        cylinder( d = l_base - 5, h = a_paredes + 2, $fn = 100 );
}
