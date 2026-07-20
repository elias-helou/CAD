chapa = 3;
altura = 50;
altura_barra = 120;
largura = 30;
furo = 10;
arr_d = 22;
arr_h = 2.2;
porca_d = 19;
porca_h = 7.8;

comprimento = 80;
insercao = 20;
util = comprimento - insercao;

pos_y_1 = insercao + 1.5 * porca_h + furo / 2;
pos_y_2 = comprimento - arr_d / 2;

difference(){
    union(){
        cube( [ chapa, comprimento, altura ] );
        translate( [ chapa + largura, 0, 0 ] )
            cube( [ chapa, comprimento, altura ] );
        
        translate( [ chapa, insercao, 0 ] )
            color( [ 1, 0, 0 ] )
                cube( [ largura, util, altura_barra ] );

    translate( [ chapa + largura / 2, pos_y_1, -( 2 * porca_h + arr_h ) ] )
        cylinder( h = 3 * porca_h + 2 * arr_h + altura_barra, d = furo, $fn = 100 );

    translate( [ chapa + largura / 2, pos_y_2, -( 2 * porca_h + arr_h ) ] )
        cylinder( h = 3 * porca_h + 2 * arr_h + altura_barra, d = furo, $fn = 100 );

    translate( [ -( 2 * porca_h + arr_h ), ( pos_y_1 + pos_y_2 ) / 2, altura / 2  ] )
        rotate( 90, [ 0, 1,0 ] )
            cylinder( h =  3 * porca_h + 2 * arr_h + 2 * chapa + largura, d = furo, $fn = 100 );

    translate( [ 0, 0, -2 * chapa ] )
        cube( [ 2 * chapa + largura, comprimento, 2 * chapa ] );
    }
    
}
echo( comprimento - pos_y_1 );
echo( comprimento - pos_y_2 );
echo( ( pos_y_1 + pos_y_2 ) / 2.0 );