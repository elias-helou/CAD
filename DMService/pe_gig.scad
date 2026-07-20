////////////////////////////////////////////////////////////
// Dimensões do "tampo" a ser fabricado em madeira ou alumínio
// Somenta a altura influenciará nas dimensões do pé.
a_tampo = 250;
l_tampo = 500;

// Dimensões do pé propriamente dito.
a_conexao = 100;
i_conexao = 70;

e_pe = 10;
l_pe = 20;

c_base = a_tampo * cos( i_conexao );

h_juncao = a_conexao * sin( i_conexao );
c_juncao = a_tampo * cos( i_conexao ) * 0.15;

// Dimensões e posição do furo:
d_furo = 4.6;
s_furos = a_conexao * 0.4;
h_furo = a_conexao * 0.5;
////////////////////////////////////////////////////////////


// Modelo:
difference(){
    union(){
        // Conexão:
        rotate( -i_conexao, [ 0, 1, 0 ] )
            cube( [ a_conexao, l_pe, e_pe ] );
        // Base:
        cube( [ c_base, l_pe, e_pe ] );
        // Junção:
        cube( [ c_juncao, l_pe, h_juncao ] );
    }
    // Remove excesso da junção:
    rotate( -i_conexao, [ 0, 1, 0 ] )
        translate( [ 0, -1, e_pe ] )
            cube( [ 100, 100, 100 ] );
    // Furo inferior:
    rotate( -i_conexao, [ 0, 1, 0 ] )
        translate( [ h_furo, 0.5 * l_pe, -1 ] )
            cylinder( d = d_furo, h = 2 * e_pe, $fn = 100 );
    // Furo superior:
    rotate( -i_conexao, [ 0, 1, 0 ] )
        translate( [ h_furo + s_furos, 0.5 * l_pe, -1 ] )
            cylinder( d = d_furo, h = 2 * e_pe, $fn = 100 );
}
