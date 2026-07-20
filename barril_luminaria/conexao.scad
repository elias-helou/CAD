include <defs.scad>

module cunha( l, h, theta ){    
    rotate( 90, [ 1, 0, 0 ] )
        translate( [ 0, 0, -l ] )
            linear_extrude(
                height = l,
                convexity = 10,
                scale = 0
            )
                polygon(
                    points = [
                        [ 0, -h ],
                        [ h * tan( theta / 2 ), 0 ],
                        [ -h * tan( theta / 2 ), 0 ]
                    ]
                );
    
}

module corpo_femea( N, theta, d = 50, bottom = 2 ){
    
    theta_h = 360 / N;
    h_cunha = ( tan( theta_h / 2 ) * d ) / ( 2 * tan( theta / 2 ) );

    intersection(){
        union(){
            translate( [ 0, 0, -bottom + 1e-3 ] )
                cylinder( d = d, h = bottom, $fn = 100 );
            
            for ( i = [ 0 : N - 1 ] )
                rotate( i * theta_h, [ 0, 0, 1 ] )
                rotate( 180, [ 0, 1, 0 ] )
                    cunha( d / 2, h_cunha, theta );
        }
        
        translate( [ 0, 0, -bottom + 1e-3 ] )
            cylinder( d = d, h = bottom + h_cunha, $fn = 100 );
    }
}

module corpo_macho( N, theta, d = 50, bottom = 2 ){

    theta_h = 360 / N;
    h_cunha = ( tan( theta_h / 2 ) * d ) / ( 2 * tan( theta / 2 ) );

    difference(){
        cylinder( d = d, h = bottom + h_cunha, $fn = 100 );
        
        corpo_femea( N, theta, d + 1e-2, bottom );
    }
}

module femea( N, theta, d = 50, bottom = 2, d_inner = 25, r_hole = 15 ){

    theta_h = 360 / N;
    h_cunha = ( tan( theta_h / 2 ) * d ) / ( 2 * tan( theta / 2 ) );
    echo( h_cunha );

    difference(){
        corpo_femea( N, theta, d, bottom );
        translate( [ 0, 0, -bottom -h_cunha - 1 ] )
            cylinder( d = eixo_conexao, h = bottom + h_cunha + 2, $fn = 100 );
        cylinder( d = d_inner, h = bottom + h_cunha + 2, $fn = 100 );
        translate( [ r_hole, 0, -bottom - 1 ] )
            cylinder( d = d_hole, h = bottom + h_cunha + 2, $fn = 100 );

    }
}

module macho( N, theta, d = 50, bottom = 2, d_inner = 25, r_hole = 15 ){

    theta_h = 360 / N;
    h_cunha = ( tan( theta_h / 2 ) * d ) / ( 2 * tan( theta / 2 ) );
    echo( h_cunha );

    difference(){
        translate( [ 0, 0, h_cunha ] )
        rotate( 180, [ 1, 0, 0 ] )
        corpo_macho( N, theta, d, bottom );
        translate( [ 0, 0, -bottom -h_cunha - 1 ] )
            cylinder( d = eixo_conexao, h = bottom + h_cunha + 2, $fn = 100 );
        cylinder( d = d_inner, h = bottom + h_cunha + 2, $fn = 100 );
        translate( [ r_hole, 0, -bottom - 1 ] )
            cylinder( d = d_hole, h = bottom + h_cunha + 2, $fn = 100 );

    }
}

femea( N = N_conexao, theta = theta_v, d = d_conexao, bottom = bottom_conexao, r_hole = r_hole, d_inner = d_inner_conexao );
