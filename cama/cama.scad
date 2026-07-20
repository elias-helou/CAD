main_h = 30;
main_w = 50;

travessa_h = 25;
travessa_w = 25;

mattress_w = 1400;
mattress_l = 1900;
mattress_h = 150;

foot_h = 300;
footer_h = foot_h + travessa_w + mattress_h + main_w;
header_h = 700;

folga = 10;

estrado_h = 15;

WHITE = [ 1.0, 1.0, 1.0 ];
BLACK = [ 0.0, 0.0, 0.0 ];

N = 9;

del = ( mattress_l + folga - N * travessa_h ) / ( N - 1 );
echo( del );
echo( N * ( mattress_w + folga ) );

    // Laterais:
    
    translate( [ 0, 0, 0 ] )
        color( BLACK ) cube( [ main_h, mattress_l + folga, main_w ] );
    
    translate( [ mattress_w + folga + main_h, 0, 0 ] )
        color( BLACK ) cube( [ main_h, mattress_l + folga, main_w ] );
    
    // "pezeira":
    translate( [ 0, -main_h, -foot_h ] )
        color( BLACK ) cube( [ main_w, main_h, footer_h ] );
    translate( [ mattress_w + main_w - main_h, -main_h, -foot_h ] )
        color( BLACK ) cube( [ main_w, main_h, footer_h ] );
    translate( [ 0, -main_h, footer_h - foot_h - main_w ] )
        color( BLACK ) cube( [ mattress_w + folga + 2 * main_h, main_h, main_w ] );

    
    // Transversais:
    translate( [ main_w, -main_h, 0 ] )
        color( BLACK ) cube( [ mattress_w + folga - 2 * ( main_w - main_h ), main_h, main_w ] );
    translate( [ main_w, mattress_l + folga, 0 ] )
        color( BLACK ) cube( [ mattress_w + folga - 2 * ( main_w - main_h ), main_h, main_w ] );
        
    // Cabeceira:
    translate( [ 0, mattress_l + folga, -foot_h ] )
        color( BLACK ) cube( [ main_w, main_h, header_h ] );
    translate( [ mattress_w + main_w - main_h, mattress_l + folga, -foot_h ] )
        color( BLACK ) cube( [ main_w, main_h, header_h ] );
    translate( [ 0, mattress_l + folga, header_h - foot_h - main_w ] )
        color( BLACK ) cube( [ mattress_w + folga + 2 * main_h, main_h, main_w ] );

    
    echo( 2 * ( mattress_l + folga ) + 2 * footer_h + 2 * header_h + 2 * ( mattress_w + folga - 2 * ( main_w - main_h ) ) );
    
    // Colchão:
    color( WHITE )
        translate( [ main_h + folga / 2, folga / 2, travessa_h + estrado_h ] )
            cube( [ mattress_w, mattress_l, mattress_h ] );
            
    // Estrado:
    for ( i = [ 0 : N - 1 ] ) {
            translate( [ main_h, i * ( del + travessa_h ), 0 ] )
                color( BLACK ) cube( [ mattress_w, travessa_h, travessa_w ] );
    }
    