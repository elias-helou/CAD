r_objeto = 130;
delta_r = 2;

z_ombro = 30;
x_ombro = 2 * sqrt( ( r_objeto + delta_r ) ^ 2 - ( z_ombro - ( r_objeto + delta_r ) ) ^ 2 );
//x_ombro = 2 * sqrt( r_objeto ^ 2 - ( z_ombro - r_objeto ) ^ 2 );
echo( x_ombro );
y_ombro = 50;
f_ombro = 8;
d_ombro = 5;

ponte_x = 15;
ponte_y = 10;
x_furo = x_ombro + 2 * d_ombro - 2 * ponte_x;
y_furo = y_ombro - 2 * ponte_y;

//x_furo = 0.9 * x_ombro;
//y_furo = 0.6 * y_ombro;
//// Largura das "pontes"
//echo( ( y_ombro - y_furo ) / 2 );
//echo( ( x_ombro - x_furo ) / 2 + d_ombro );

z_furo = 2 * z_ombro + f_ombro + 1;

difference(){
    translate( [ -x_ombro / 2 - d_ombro, -y_ombro / 2, -f_ombro ] )
        cube( [ x_ombro + 2 * d_ombro, y_ombro, z_ombro + f_ombro + delta_r ] );
    
    translate( [ 0, 0.55 * y_ombro, r_objeto + delta_r ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( r = r_objeto + delta_r, h = 1.1 * y_ombro, $fn = 200 );
    
    translate( [ -x_furo / 2, -y_furo / 2, -f_ombro - 0.5 ] )
        cube( [ x_furo, y_furo, z_furo ] );
}

translate( [ 0, 0, -f_ombro ] )
    scale( [ 0.35, 1, 1 ] )
        cylinder( d = y_ombro, h = f_ombro, $fn = 200 );
// Cubo para completar os 8mm que deveria ter tido o modelo:
// No código acima já está corrigido.
//translate( [ -x_ombro / 2 - d_ombro, -y_ombro / 2, 0 ] )
//    cube( [ x_ombro + 2 * d_ombro, y_ombro, f_ombro - 3 ] );
