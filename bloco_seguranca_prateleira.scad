c_bloco = 60;
a_bloco = 10;
l_bloco = 15;

hole_dist = 0.6 * c_bloco;
hole_d = 4;
hole_head_d = 8;
hole_head_h = a_bloco - 5;

difference(){
    cube( [ c_bloco, l_bloco, a_bloco ] );
    translate( [ c_bloco / 2 - hole_dist / 2, l_bloco / 2, -1 ] )
        cylinder( h = a_bloco + 2, d = hole_d, $fn = 50 );
    translate( [ c_bloco / 2 - hole_dist / 2, l_bloco / 2, a_bloco - hole_head_h ] )
        cylinder( h = a_bloco + 2, d = hole_head_d, $fn = 50 );
    translate( [ c_bloco / 2 + hole_dist / 2, l_bloco / 2, -1 ] )
        cylinder( h = a_bloco + 2, d = hole_d, $fn = 50 );
    translate( [ c_bloco / 2 + hole_dist / 2, l_bloco / 2, a_bloco - hole_head_h ] )
        cylinder( h = a_bloco + 2, d = hole_head_d, $fn = 50 );
}
