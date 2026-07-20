l_vao = 39;

a_topo = 3;
c_topo = 190;
l_topo = l_vao + 6;;

a_chanfro = 1.6;
c_chanfro = 13.6 + 1; // Comprimento mais tolerância
l_chanfro = 3.0 + 1 + 1; // Largura mais tolerância, mas espeço extra para diferença funcionar.

c_tomada = 37;
l_tomada = 25;

d_tomadas = ( c_topo - 2 * c_tomada ) / 3;

a_reforco = 6.0;
l_reforco = 10.0;
c_reforco = 159;
d_reforco = 3;

fn = 100;

l_amarra = 4;
a_amarra = 2;
r_amarra = 15;

module ring( ir, or, l ){    
    rotate( 90, [ 0, 1, 0 ] )
        translate( [ 0, 0, -l / 2 ] )
            difference(){
                cylinder( h = l, r = or, $fn = fn );
                translate( [ 0, 0, -1 ] )
                    cylinder( h = l + 2, r = ir, $fn = fn );
            }    
}

difference(){
    
    union(){
        // tampo
        cube( [ l_topo, c_topo - l_topo, a_topo ], center = true );
        translate( [ 0, ( c_topo - l_topo ) / 2, -a_topo / 2 ] )
            cylinder( h = a_topo, d = l_topo, $fn = fn );
        translate( [ 0, -( c_topo - l_topo ) / 2, -a_topo / 2 ] )
            cylinder( h = a_topo, d = l_topo, $fn = fn );
        // Reforços
        translate( [ 0, 0, -( a_topo + a_reforco ) / 2 + 1 ] )
            cube( [ l_reforco, c_reforco, a_reforco ], center = true );
        translate( [ 0, 0, -( a_topo + a_reforco ) / 2 + 1 ] )
            cube( [ l_vao, l_reforco, a_reforco ], center = true );
        translate( [ 0, -( d_tomadas / 2 + c_tomada + l_reforco / 2 + d_reforco ), -( a_topo + a_reforco ) / 2 + 1 ] )
            cube( [ l_vao, l_reforco, a_reforco ], center = true );
        translate( [ 0, ( d_tomadas / 2 + c_tomada + l_reforco / 2  + d_reforco ), -( a_topo + a_reforco ) / 2 + 1 ] )
            cube( [ l_vao, l_reforco, a_reforco ], center = true );
    }
    
    // Tomadas    
    translate( [ 0, ( c_tomada + d_tomadas ) / 2, 0 ] )
        cube( [ l_tomada, c_tomada, a_topo + 2 * a_reforco + 1 ], center = true );
    translate( [ 0, -( c_tomada + d_tomadas ) / 2, 0 ] )
        cube( [ l_tomada, c_tomada, a_topo + 2 * a_reforco + 1 ], center = true );
    
    // Chanfros
    translate( [ ( l_chanfro + l_tomada ) / 2 - 1, ( c_tomada + d_tomadas ) / 2, -a_chanfro ] )
        cube( [ l_chanfro, c_chanfro, a_topo ], center = true );
    translate( [ 1 - ( l_chanfro + l_tomada ) / 2, ( c_tomada + d_tomadas ) / 2, -a_chanfro ] )
        cube( [ l_chanfro, c_chanfro, a_topo ], center = true );
    translate( [ ( l_chanfro + l_tomada ) / 2 - 1, -( c_tomada + d_tomadas ) / 2, -a_chanfro ] )
        cube( [ l_chanfro, c_chanfro, a_topo ], center = true );
    translate( [ 1 - ( l_chanfro + l_tomada ) / 2, -( c_tomada + d_tomadas ) / 2, -a_chanfro ] )
        cube( [ l_chanfro, c_chanfro, a_topo ], center = true );    

    // Amarras
    translate( [ 0, 0, -( r_amarra + a_topo / 2 )] )
        ring( r_amarra - a_amarra / 2, r_amarra + a_amarra / 2, l_amarra );
    translate( [ l_amarra / 2 + l_tomada / 2, 0, -( a_topo / 2 + a_reforco / 2 - 0.5 )] )
        cube( [ l_amarra, c_topo, a_amarra ], center = true );
    translate( [ -( l_amarra / 2 + l_tomada / 2 ), 0, -( a_topo / 2 + a_reforco / 2 - 0.5 )] )
        cube( [ l_amarra, c_topo, a_amarra ], center = true );
}

