include <defs.scad>
use <pescoco_medio.scad>
use <conexao.scad>
use <pescoco_superior.scad>
use <pescoco_inferior.scad>

pescm();

translate( [ 0, 0, -del_pescm ] )
    rotate( angulo_pescm, [ 1, 0, 0 ] )
        translate( [ 0, 0, h_pescm ] )
            rotate( 90, [ 0, 1, 0 ] )
                translate( [ 0, 0, -h_cunha/2 - bottom_conexao - thick_pescs / 2 - tol_conexao / 2 ] ) {
                    translate( [ 0, 0, h_cunha + 2 * bottom_conexao + thick_pescs + tol_conexao ] ){
                        rotate( 180, [ 1, 0, 0 ] ){
                            translate( [ 0, 0, -h_cunha / 2 ] )
                                color ( [ 1, 0, 0 ] ) macho( N = N_conexao, theta = theta_v, d = d_conexao, bottom = bottom_conexao, r_hole = r_hole );
                            translate( [ 0, 0, h_cunha / 2 + tol_conexao ] )
                                rotate( 180, [ 1, 0, 0 ] )
                                    color ( [ 1, 0, 1 ] ) femea( N = N_conexao, theta = theta_v, d = d_conexao, bottom = bottom_conexao, r_hole = r_hole );
                        }
                    }
                    translate( [ 0, 0, -h_cunha / 2 ] )
                        color ( [ 1, 0, 0 ] ) macho( N = N_conexao, theta = theta_v, d = d_conexao, bottom = bottom_conexao, r_hole = r_hole );
                    translate( [ 0, 0, h_cunha / 2 + tol_conexao ] )
                        rotate( 180, [ 1, 0, 0 ] )
                            color ( [ 1, 0, 1 ] ) femea( N = N_conexao, theta = theta_v, d = d_conexao, bottom = bottom_conexao, r_hole = r_hole );
                }

translate( [ -thick_pescs / 2, 0, -del_pescm ] )
    rotate( angulo_pescm, [ 1, 0, 0 ] )
        translate( [ 0, 0, h_pescm ] )
            rotate( 85, [ -1, 0, 0 ] )
                translate( -[ -thick_pescs / 2, ( d_barril + wall_conn_pescs + d_conexao ) / 2 + dist_pescs, lip_barril / 2 ] )
                    pescs();

translate( [ 0, 0, -bottom_wall_pescoco ] )
    rotate( 180, [ 1, 0, 0 ] )
        pescoco();