// O apoio será composto de um suporte
// que funcionará sob leve pressão no
// vão do console. A parte mais complexa
// da modelagem é este suporte.

// Altura total do suporte (sob pressão)
a_suporte = 100;

// Dimensões da mola
c_mola = 35;
d_mola = 7;

// Curso total da mola
corrida_mola = 15;

// Curso da mola sob pressão
trabalho_mola = 10;

// Dimensões dos eixos
d_eixo = 5;
c_eixo = c_mola + 20;

// Dimensões do corpo
l_corpo = 20 + 3 * d_eixo;
p_corpo = 10;
c_corpo = a_suporte / 2 - ( c_mola - trabalho_mola ) / 2;

folga = 10;

// Distância entre clilindros laterais e parede:
d_cil_par = 2;

// Dimensões dos vãos para os links:
l_vaos = 4;
d_vao_parede_a = 15;
d_vao_parede_b = 5;

// Dimensões do encaixe:
l_encaixe = l_corpo / 2;

// Diâmetro do eixo para sapata:
d_parafuso = 3.5;

// Teremos dois elementos estruturais que
// suportarão eixos e mola:

module corpo(){
    
    difference(){
        union(){
            // Corpo:
            difference(){
                translate( [ 0, -c_corpo / 2 - ( c_mola - trabalho_mola ) / 2, 0 ] )
                    cube( [ l_corpo, c_corpo, p_corpo ], center = true );
               translate( [ -500, -1000 - corrida_mola - c_corpo + 1.4 * p_corpo, -500 ] )
                   cube( [ 1000, 1000, 1000 ] );
            }
            // Encaixe
            translate( [ -l_encaixe / 2, -corrida_mola - c_corpo + p_corpo, 0 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( d = p_corpo, h = l_encaixe, $fn = 50 );

translate( [ -l_corpo / 2, -c_corpo / 2 - ( c_mola - trabalho_mola ) / 2 + 8, 0 ] )
    rotate( 90, [ 0, 0, 1 ] )
        cylinder( h = p_corpo / 2, r = 10, $fn = 3 );
translate( [ l_corpo / 2, -c_corpo / 2 - ( c_mola - trabalho_mola ) / 2 + 8, 0 ] )
    rotate( 90, [ 0, 0, 1 ] )
        cylinder( h = p_corpo / 2, r = 10, $fn = 3 );
        }
        
        // Cilindros para os eixos:
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( d = d_eixo, h = c_eixo / 2 + corrida_mola / 2, $fn = 50 );
        translate( [ l_corpo / 2 - d_eixo / 2 - d_cil_par, 0, 0 ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( d = d_eixo, h = c_eixo/ 2 + corrida_mola / 2, $fn = 50 );
        translate( [ -( l_corpo / 2 - d_eixo / 2 - d_cil_par ), 0, 0 ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( d = d_eixo, h = c_eixo / 2 + corrida_mola / 2, $fn = 50 );
        // Vãos para os elos:
        translate( [ -l_vaos / 2 + ( l_corpo / 2 - d_eixo / 2 - d_cil_par ) / 2, -c_corpo - ( c_mola - trabalho_mola ) / 2 + d_vao_parede_a, -25 ] )
            cube( [ l_vaos, c_corpo - ( d_vao_parede_a + d_vao_parede_b ), 50 ] );
        translate( [ -l_vaos / 2 - ( l_corpo / 2 - d_eixo / 2 - d_cil_par ) / 2, -c_corpo - ( c_mola - trabalho_mola ) / 2 + d_vao_parede_a, -25 ] )
            cube( [ l_vaos, c_corpo - ( d_vao_parede_a + d_vao_parede_b ), 50 ] );
        
        // Furo para o eixo da sapata:
        translate( [ -250, -corrida_mola - c_corpo + p_corpo, 0 ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( h = 500, d = d_parafuso, $fn = 50 );
    }
}

l_aba_pe = ( l_corpo - l_encaixe ) / 2 - 0.5;
p_aba_pe = p_corpo * 1.0;
h_aba_pe = 10;
delta_aba_pe = 0.1;

h_sapata = 2;
l_sapata = 50;
c_sapata = 30;

module sapata(){
    difference(){
        union(){
            translate( [ -l_aba_pe / 2 - ( l_corpo / 2 - l_aba_pe / 2 ), -corrida_mola - c_corpo + 1.4 * p_corpo - h_aba_pe - delta_aba_pe, -p_aba_pe / 2 ] )
                cube( [ l_aba_pe, h_aba_pe - p_aba_pe / 2, p_aba_pe ] );
            translate( [ -l_aba_pe / 2 - ( l_corpo / 2 - l_aba_pe / 2 ), -corrida_mola - c_corpo + 1.4 * p_corpo - h_aba_pe - delta_aba_pe + ( h_aba_pe - p_aba_pe / 2 ), 0 ] )
                rotate( 90, [ 0, 1, 0 ] )
                cylinder( h = l_aba_pe, d = p_aba_pe, $fn = 50 );
            translate( [ -l_aba_pe / 2 + ( l_corpo / 2 - l_aba_pe / 2 ), -corrida_mola - c_corpo + 1.4 * p_corpo - h_aba_pe - delta_aba_pe, -p_aba_pe / 2 ] )
                cube( [ l_aba_pe, h_aba_pe - p_aba_pe / 2, p_aba_pe ] );
            translate( [ -l_aba_pe / 2 + ( l_corpo / 2 - l_aba_pe / 2 ), -corrida_mola - c_corpo + 1.4 * p_corpo - h_aba_pe - delta_aba_pe + ( h_aba_pe - p_aba_pe / 2 ), 0 ] )
                rotate( 90, [ 0, 1, 0 ] )
                cylinder( h = l_aba_pe, d = p_aba_pe, $fn = 50 );
            
            translate( [ -l_sapata / 2, , -corrida_mola - c_corpo + 1.4 * p_corpo - h_aba_pe - delta_aba_pe- h_sapata + 1, -c_sapata / 2 ] )
                cube( [ l_sapata, h_sapata, c_sapata ] );
        }
        // Furo para o eixo da sapata:
        translate( [ -250, -corrida_mola - c_corpo + p_corpo, 0 ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( h = 500, d = d_parafuso, $fn = 50 );
    }
}

d_links_furos = 40;
d_furos = 3.3;
d_links = d_links_furos + 10;
l_links = d_vao_parede_a + 5;
a_links = 4;
module links(){
    difference(){
        translate( [ -l_links / 2, -d_links / 2, p_corpo / 2 + 0.4 ] )
            cube( [ l_links, d_links, a_links ] );
        
        translate( [ ( l_corpo / 2 - d_eixo / 2 - d_cil_par ) / 2, -d_links_furos / 2, -50 ] )
            cylinder( d = d_furos, h = 100, $fn = 50 );
        translate( [ -( l_corpo / 2 - d_eixo / 2 - d_cil_par ) / 2, -d_links_furos / 2, -50 ] )
            cylinder( d = d_furos, h = 100, $fn = 50 );
        translate( [ ( l_corpo / 2 - d_eixo / 2 - d_cil_par ) / 2, d_links_furos / 2, -50 ] )
            cylinder( d = d_furos, h = 100, $fn = 50 );
        translate( [ -( l_corpo / 2 - d_eixo / 2 - d_cil_par ) / 2, d_links_furos / 2, -50 ] )
            cylinder( d = d_furos, h = 100, $fn = 50 );
    }
}

//theta_garra = 30;
//l_min_garra = 65;
//w_garra = 3;
//a_garra = 5;
//l_dedo_garra = 10;
//w_dedo_garra = w_garra;

theta_garra = 20;
l_min_garra = 65;
w_garra = 4;
a_garra = 5;
l_dedo_garra = 10;
w_dedo_garra = w_garra;

module meia_garra(){
    rotate( theta_garra, [ 0, 0, 1 ] ){
        cube( [ w_garra, l_min_garra / cos( theta_garra ) / 2 + 1, a_garra ] );
    translate( [ -l_dedo_garra, l_min_garra / cos( theta_garra ) / 2, 0 ] )
        cube( [ l_dedo_garra + w_garra, w_dedo_garra, a_garra ] );
    translate( [ 0, l_min_garra / cos( theta_garra ) / 2 * 0.9, 0 ] )
        cube( [ 6 + w_garra, w_dedo_garra, a_garra ] );
    }
}

c_cubo_garra = 28;
l_cubo_garra = 9;
dist_hole_garra = 20;
d_hole_garra = 3;
module garra(){
    difference(){
        translate( [ 0, a_garra - ( c_mola - trabalho_mola ) / 2, -l_braco ] )
            rotate( 90, [ 1, 0, 0 ] )
                rotate( 90, [ 0, 0, 1 ] ){
                    meia_garra();
                    mirror( [ 0, 1, 0 ] )
                        meia_garra();
                    translate( [ -l_cubo_garra / 2 + 0, -c_cubo_garra / 2, 0 ] )
                        cube( [ l_cubo_garra, c_cubo_garra, a_garra ] );
                }
                
       translate( [ dist_hole_garra / 2, 0, -l_braco ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( h = 1000, d = d_hole_garra, $fn = 50 );
       translate( [ -dist_hole_garra / 2, 0, -l_braco ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( h = 1000, d = d_hole_garra, $fn = 50 );
    }
}

module arco( d, h, w, l ){
    difference(){
        translate( [ 0, l - d / 2, 0 ] )
            cylinder( d = d, h = h, $fn = 50 );
        translate( [ -2 * d, -2 * d, -h + 0.1 ] )
            cube( [ 4 * d, 2 * d, 2 * h + 0.1 ] );
        translate( [ w / 2, -0.1,  -h + 0.1 ] )
            cube( [ 4 * d, 2 * d, 2 * h + 0.1 ] );
        mirror( [ 1, 0, 0 ] )
            translate( [ w / 2, -0.1,  -h + 0.1 ] )
                cube( [ 4 * d, 2 * d, 2 * h + 0.1 ] );
    }   
}

h_conect = 20;
c_conect = 10;
y_conect = 10;
l_braco = 80;
delta_braco = 5;
delta_arco_conect = 10;
lip_len = 2;
lip_thick = 2;
x_conect_hand = c_cubo_garra;
y_conect_hand = 5;
z_conect_hand = 10;

module conect(){
    difference(){
        translate( [0, -( c_mola - trabalho_mola ) / 2, -p_corpo / 2 + lip_len ] )
            mirror( [ 0, 0, 1 ] )
                rotate( 90, [ 1, 0, 0 ] )
                    arco( d = 1.5 * l_corpo, h = y_conect, w = l_corpo + lip_thick, l = h_conect );
        cube( [ l_corpo, 30 * c_corpo, p_corpo ], center = true );
        cube( [ l_corpo - 10, 30 * c_corpo, p_corpo + 20 ], center = true );
    }
    translate( [ -y_conect / 2, -y_conect - ( c_mola - trabalho_mola ) / 2, -( l_braco + delta_braco - h_conect ) - p_corpo / 2 - h_conect + delta_braco ] )
        cube( [ y_conect, y_conect, l_braco + delta_braco - h_conect ] );
    difference(){
        translate( [ -x_conect_hand / 2, -y_conect_hand - ( c_mola - trabalho_mola ) / 2, - p_corpo / 2 - l_braco ] )
            cube( [ x_conect_hand, y_conect_hand, z_conect_hand ] );
       translate( [ dist_hole_garra / 2, 0, -l_braco ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( h = 1000, d = d_hole_garra, $fn = 50 );
       translate( [ -dist_hole_garra / 2, 0, -l_braco ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( h = 1000, d = d_hole_garra, $fn = 50 );
    }
}


//color( "yellow", 1.0 ) corpo();
//color( "green", 1.0 ) sapata();
//mirror( [ 0, 1, 0 ] ){
//    color( "yellow", 1.0 ) corpo();
//    color( "green", 1.0 ) sapata();
//}
//color( "red", 1.0 ) links();
//mirror( [ 0, 0, 1 ] )
//    color( "red", 1.0 ) links();
//
//color( "gray", 1.0 ) conect();
color( "yellow", 1.0 ) garra();
//translate( [ 0, ( c_mola - trabalho_mola ) + y_conect, 0 ] ){
//    color( "gray", 1.0 ) conect();
//    color( "yellow", 1.0 ) garra();
//}