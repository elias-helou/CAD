include <defs.scad>

module pizza( d, angle, h, N = 100 ) {
    
    points = [
        [ 0, 0 ],
        for ( i = [ 1 : N ] )
            [ d / 2 * sin( ( i - 1 ) / ( N - 1 ) * angle ), d / 2 * cos( ( i - 1 ) / ( N - 1 ) * angle ) ]
    ];
    
    linear_extrude( height = h )
        polygon( points );
    
}

angle = 360 * length_conn_pescs / p_barril;
del_angle = ( angle - 2 * del_par_barril ) / ( N_par_barril - 1 );

x = d_conexao * ( 1 - cos( asin( width_pescs / d_conexao ) ) ) / 2;

module pescs(){

    rotate( angle / 2, [ 0, 0, 1 ] ){
    
        difference(){
            pizza( d_barril + wall_conn_pescs, angle, lip_barril );
            translate( [ 0, 0, -1 ] ){
                cylinder( d = d_barril, h = lip_barril + 2, $fn = 100 * 360 / angle );
            }
            
            
            rotate( -del_par_barril - pos_plug * del_angle + angle_plug / 2, [ 0, 0, 1 ] )
                translate( [ -plug_brack_h / 2, ( d_barril + wall_conn_pescs / 2 ) / 2 - plug_brack_w / 2, -1 ] )
                    cube( [ plug_brack_h, plug_brack_w, lip_barril + 2 ] );
            rotate( -del_par_barril - pos_plug * del_angle - angle_plug / 2, [ 0, 0, 1 ] )
                translate( [ -plug_brack_h / 2, ( d_barril + wall_conn_pescs / 2 ) / 2 - plug_brack_w / 2, -1 ] )
                    cube( [ plug_brack_h, plug_brack_w, lip_barril + 2 ] );
            
            for ( i = [ 1 : N_par_barril ] )
                translate( [ 0, 0, lip_barril / 2 ] )
                    rotate( del_par_barril + ( i - 1 ) * del_angle, [ 0, 0, -1 ] )
                        rotate( -90, [ 1, 0, 0 ] )
                            cylinder( d = d_par_barril, h = 2 * ( d_barril + wall_conn_pescs ), $fn = 20 );
                
        }
        
        rotate( angle / 2, [ 0, 0, -1 ] )
            translate( [ -thick_pescs / 2, ( d_barril + wall_conn_pescs + d_conexao ) / 2 + dist_pescs, lip_barril / 2 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    difference(){
                        union(){
                            translate( [ -width_pescs / 2, -d_conexao / 2 - dist_pescs - wall_conn_pescs / 4, -( thick_pescs - thick_pescs ) / 2 ] )
                                cube( [ width_pescs, dist_pescs + x + wall_conn_pescs / 4, thick_pescs ] );
                            cylinder( d = d_conexao, h = thick_pescs, $fn = 100 );
                        }
                            translate( [ 0, 0, -1 ] )
                                cylinder( d = eixo_conexao, h = thick_pescs + 2, $fn = 100 );
                            translate( [ r_hole, 0, -1 ] )
                                cylinder( d = d_hole, h = thick_pescs + 2, $fn = 100 );
                            translate( [ 0, 0, thick_pescs ] )
                                cylinder( d = d_conexao + tol_pescs, h = thick_pescs, $fn = 100 );
                            translate( [ 0, 0, -thick_pescs ] )
                                cylinder( d = d_conexao + tol_pescs, h = thick_pescs, $fn = 100 );
                    }
    }
}

pescs();