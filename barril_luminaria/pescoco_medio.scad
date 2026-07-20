include <defs.scad>
use <conexao.scad>



thick_conexao = 2 * ( h_cunha + 2 * bottom_conexao ) + thick_pescs + thick_pescm;
echo( thick_conexao );

module pescm_base(){
    difference(){
        cylinder( d = d_top_pescoco + wall_pescoco + tol_pescoco, h = thick_base_pescm, $fn = 100 );
        translate( [ 0, 0, -1 ] )
            cylinder( d = d_hole, h = thick_base_pescm + 2, $fn = 100 );
    }
}

module pescm_lado(){
    
    difference(){
        intersection(){
            translate( [ -thick_conexao / 2, 0, -sin( angulo_pescm ) * ( d_top_pescoco + wall_pescoco + tol_pescoco ) / 2 + thick_base_pescm ] )
                rotate( angulo_pescm, [ 1, 0, 0 ] )
                translate( [ -thick_pescm / 2, -( d_top_pescoco + wall_pescoco + tol_pescoco ) / 2, 0 ] )
                    cube( [ thick_pescm, d_top_pescoco + wall_pescoco + tol_pescoco, h_pescm ] );
            
            cylinder( d = d_top_pescoco + wall_pescoco + tol_pescoco, h = h_pescm + sin( angulo_pescm ) * ( d_top_pescoco + wall_pescoco + tol_pescoco ) / 2, $fn = 100 );
        }
        
        translate( [ -thick_conexao / 2, 0, -del_pescm ] )
            rotate( angulo_pescm, [ 1, 0, 0 ] )
                translate( [ 0, 0, h_pescm ] )
                    rotate( 90, [ 0, 1, 0 ] )
                        translate( [ 0, 0, -thick_pescm / 2 ] )
                            union(){
                                translate( [ 0, 0, -1 ] )
                                    cylinder( d = eixo_conexao, h = thick_pescm + 2, $fn = 100 );
                                translate( [ r_hole, 0, -1 ] )
                                    cylinder( d = d_hole, h = thick_pescm + 2, $fn = 100 );
                            }

    }
    
    translate( [ -thick_conexao / 2, 0, -del_pescm ] )
        rotate( angulo_pescm, [ 1, 0, 0 ] )
            translate( [ 0, 0, h_pescm ] )
                rotate( 90, [ 0, 1, 0 ] )
                    translate( [ 0, 0, -thick_pescm / 2 ] )
                        difference(){
                            cylinder( d = d_conexao, h = thick_pescm, $fn = 100 );
                            translate( [ 0, 0, -1 ] )
                                cylinder( d = eixo_conexao, h = thick_pescm + 2, $fn = 100 );
                            translate( [ r_hole, 0, -1 ] )
                                cylinder( d = d_hole, h = thick_pescm + 2, $fn = 100 );
                        }
    
}

module pescm(){
    pescm_lado();
    mirror( [ 1, 0, 0 ] )
        pescm_lado();
    pescm_base();
}

pescm();
