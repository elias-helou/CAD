wall = 0.5;
al_width = 5;
al_height = 1;
led_width = 10;   // Largura da fita led
led_length = 50;  // Comprimento de cada segmento
N = 1;            // Número de segmentos

tab_width = 1;

factor = 2.0;

difference(){

    union(){
        cylinder( d = factor * led_width + 2 * wall, h = N * led_length, $fn = 50 );
        translate( [ -factor * led_width / 2 - wall - tab_width, -wall, 0 ] )
            cube( [ factor * led_width + 2 * wall + 2 * tab_width, wall + 1, N * led_length ] );
    }

    translate( [ 0, 0, -1 ] )
        cylinder( d = factor * led_width, h = N * led_length + 2, $fn = 50 );

    translate( [ -factor * led_width, 0, -1 ] )
        cube( [ 2 * factor * led_width, 10 * factor * led_width, N * led_length + 2 ] );    
}
//translate( [ -factor * led_width / 2 - wall, 0, 0 ] )
//    cube( [ factor * led_width + 2 * wall, wall, N * led_length ] );    

//cube( [ factor * led_width * 3.15 / 2.0, N * led_length, 0.32 ] );