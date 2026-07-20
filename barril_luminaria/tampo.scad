luminaria_d = 174 - 6 + 3 + 1.2 - 1 - 0.5;
pele_d = 160;
pele_z = 0.4;

disco_d = 145;
disco_z = 15;

juntas_z = 15;
juntas_x = 20;
juntas_y = luminaria_d - disco_d;

estrut_z = juntas_z;
estrut_x = 20;
estrut_y = luminaria_d - disco_d;
estrut_n = 4;
estrut_theta_0 = 180 / estrut_n;

moldura_d = 165;
moldura_z = juntas_z;
moldura_x = 20;
moldura_y = luminaria_d - disco_d;
moldura_n = 8;
moldura_theta_0 = 180 / moldura_n;

trava_z = 3;
trava_theta = 80;
trava_d = luminaria_d - 4;

montagem_delta = 0.5;

furos_d = 3.8;

module conexao(){
    difference(){
        intersection(){
            difference(){
                union(){
                    cylinder( d = luminaria_d, h = disco_z, $fn = 100 );
                    
//                    // Juntas para as metades (não cabe inteira na impressora):
//                    translate( [ -juntas_x / 2, -luminaria_d / 2, 0 ] )
//                        cube( [ juntas_x, juntas_y, juntas_z + disco_z ] );
//                    translate( [ -juntas_x / 2, luminaria_d / 2 - juntas_y, 0 ] )
//                        cube( [ juntas_x, juntas_y, juntas_z + disco_z ] );
                    
                    // Abas estruturais para unir moldura ao barril:
                    for ( i = [ 0 : estrut_n - 1 ] )
                            rotate( estrut_theta_0 + 360 / estrut_n * i, [ 0, 0, 1 ] )
                                translate( [ -estrut_x / 2, -luminaria_d / 2, 0 ] )
//                                    cube( [ estrut_x, estrut_y, estrut_z + disco_z ] );
                                    cube( [ estrut_x, estrut_y, estrut_z ] );
    
                    // Abas para unir moldura à pela:
                    for ( i = [ 0 : moldura_n - 1 ] )
                            rotate( moldura_theta_0 + 360 / moldura_n * i, [ 0, 0, 1 ] )
                                translate( [ -moldura_x / 2, -luminaria_d / 2, 0 ] )
//                                    cube( [ moldura_x, moldura_y, moldura_z + disco_z ] );
                                    cube( [ moldura_x, moldura_y, moldura_z ] );
                }
                
                translate( [ 0, 0, -1 ] )
                    cylinder( d = disco_d, h = 100 * disco_z + 2, $fn = 100 );
            
            // Furo para parafusos das emendas de cada metade:
                translate( [ -juntas_x/2 - 1, -( luminaria_d + disco_d ) / 4 + 2, disco_z + juntas_z / 2 + 1 ] )
                    rotate( 90, [ 0, 1, 0 ] )
                        cylinder( d = 3, h = juntas_x + 2, $fn = 30 );
                translate( [ -juntas_x/2 - 1, ( luminaria_d + disco_d ) / 4 - 2, disco_z + juntas_z / 2 + 1 ] )
                    rotate( 90, [ 0, 1, 0 ] )
                        cylinder( d = 3, h = juntas_x + 2, $fn = 30 );
    
            // Furos das abas estruturais para unir moldura ao barril:
            for ( i = [ 0 : estrut_n - 1 ] )
                    rotate( estrut_theta_0 + 360 / estrut_n * i, [ 0, 0, 1 ] )
//                        translate( [0, luminaria_d / 2 + 1, disco_z + estrut_z / 2 ] )
//                        translate( [0, luminaria_d / 2 + 1, disco_z / 2 + estrut_z / 2 ] )
                        translate( [0, luminaria_d / 2 + 1, estrut_z / 2 ] )
                            rotate( 90, [ 1, 0, 0 ] )
                                cylinder( d = furos_d, h = juntas_y + 2, $fn = 30 );
    
            // Furos das abas para unir trava à moldura:
            for ( i = [ 0 : moldura_n - 1 ] )
                    rotate( moldura_theta_0 + 360 / moldura_n * i, [ 0, 0, 1 ] )
                        translate( [0, ( trava_d + disco_d ) / 4, -1 ] )
                            cylinder( d = furos_d, h = juntas_y + 2, $fn = 30 );
            }
            cylinder( d = luminaria_d, h = 100 * disco_z + 2, $fn = 100 );
        }        
    }
}

module conexao_metade(){
    difference(){
        conexao();
    translate( [ 0, -luminaria_d / 2, -1 ] )
        cube( [ luminaria_d, luminaria_d, disco_z + juntas_z + 2 ] );
    }
}

module moldura(){
    translate( [ 0, 0, -trava_z - pele_z - 2 * montagem_delta ] ){
        difference(){
            cylinder( d = trava_d, h = trava_z, $fn = 100 );
            translate( [ 0, 0, -1 ] )
                cylinder( d = disco_d, h = trava_z + 2, $fn = 100 );
            rotate( 90 - trava_theta / 2, [ 0, 0, 1 ] )
                translate( [ -luminaria_d, 0, -1 ] )
                    cube( [ luminaria_d * 2, luminaria_d, disco_z + 2 ] );
            rotate( trava_theta / 2 - 90, [ 0, 0, 1 ] )
                translate( [ -luminaria_d, 0, -1 ] )
                    cube( [ luminaria_d * 2, luminaria_d, disco_z + 2 ] );
                   // Furos das abas para unir trava à moldura:
            for ( i = [ 0 : moldura_n - 1 ] )
                    rotate( moldura_theta_0 + 360 / moldura_n * i, [ 0, 0, 1 ] )
                        translate( [0, ( trava_d + disco_d ) / 4, -1 ] )
                            cylinder( d = 5, h = juntas_y + 2, $fn = 30 );}
        translate( [ -cos( 90 - trava_theta / 2 ) * ( trava_d + disco_d ) / 4, -sin( 90 - trava_theta / 2 ) * ( trava_d + disco_d ) / 4, 0 ] )
            cylinder( d = ( trava_d - disco_d ) / 2, h = trava_z, $fn = 30 );
        translate( [ cos( 90 - trava_theta / 2 ) * ( trava_d + disco_d ) / 4, -sin( 90 - trava_theta / 2 ) * ( trava_d + disco_d ) / 4, 0 ] )
            cylinder( d = ( trava_d - disco_d ) / 2, h = trava_z, $fn = 30 );
   }
}

module pele(){
    translate( [ 0, 0, -pele_z - montagem_delta ] )
        difference(){
            cylinder( d = pele_d, h = pele_z, $fn = 100 );
            
            for ( i = [ 0 : moldura_n - 1 ] )
                    rotate( moldura_theta_0 + 360 / moldura_n * i, [ 0, 0, 1 ] )
                        translate( [0, ( trava_d + disco_d ) / 4, -1 ] )
                            cylinder( d = 5, h = juntas_y + 2, $fn = 30 );
        }
}


//conexao_metade();
moldura();
//pele();

//conexao();
//pele();

