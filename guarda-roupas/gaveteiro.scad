module metalon( perf, l, angle1 = 0, angle2 = 0 ) {
    
    cube( [ perf[ 0 ], perf[ 1 ], l ] );
    
}

BLACK = [ 0.0, 0.0, 0.0 ];
WHITE = [ 1.0, 1.0, 1.0 ];

espessura_tampo_lateral = 15;
profundidade_tampo_lateral = 431;
altura_tampo_lateral = 790;

largura_gaveta = 654;
chapa_trilho = 1;
folga = 2;

espessura_metalon = 15;

distancia_tampo_lateral = largura_gaveta + 2 * chapa_trilho + 2 * folga;

color( WHITE )
    cube( [ espessura_tampo_lateral, profundidade_tampo_lateral, altura_tampo_lateral ] );

translate( [ distancia_tampo_lateral, 0, 0 ] )
    color( WHITE )
        cube( [ espessura_tampo_lateral, profundidade_tampo_lateral, altura_tampo_lateral ] );

translate( [ -espessura_metalon, 0, -espessura_tampo_lateral ] )
    color( BLACK )
        metalon( [ espessura_metalon, espessura_metalon ], altura_tampo_lateral + 2 * espessura_metalon );
translate( [ -espessura_metalon, profundidade_tampo_lateral - espessura_metalon, -espessura_tampo_lateral ] )
    color( BLACK )
        metalon( [ espessura_metalon, espessura_metalon ], altura_tampo_lateral + 2 * espessura_metalon );
        echo( altura_tampo_lateral + 2 * espessura_metalon );
translate( [ -espessura_metalon, 0, 0 ] )
    rotate( -90, [ 1, 0, 0 ] )
        color( BLACK )
            metalon( [ espessura_metalon, espessura_metalon ], profundidade_tampo_lateral );
            echo( profundidade_tampo_lateral );
translate( [ -espessura_metalon, 0, altura_tampo_lateral + espessura_metalon ] )
    rotate( -90, [ 1, 0, 0 ] )
        color( BLACK )
            metalon( [ espessura_metalon, espessura_metalon ], profundidade_tampo_lateral );
            
translate( [ espessura_metalon + distancia_tampo_lateral + espessura_tampo_lateral, 0, 0 ] ){
    translate( [ -espessura_metalon, 0, -espessura_tampo_lateral ] )
        color( BLACK )
            metalon( [ espessura_metalon, espessura_metalon ], altura_tampo_lateral + 2 * espessura_tampo_lateral );
    translate( [ -espessura_metalon, profundidade_tampo_lateral - espessura_metalon, -espessura_tampo_lateral ] )
        color( BLACK )
            metalon( [ espessura_metalon, espessura_metalon ], altura_tampo_lateral + 2 * espessura_tampo_lateral );
    translate( [ -espessura_metalon, 0, 0 ] )
        rotate( -90, [ 1, 0, 0 ] )
            color( BLACK )
                metalon( [ espessura_metalon, espessura_metalon ], profundidade_tampo_lateral );
    translate( [ -espessura_metalon, 0, altura_tampo_lateral + espessura_metalon ] )
        rotate( -90, [ 1, 0, 0 ] )
            color( BLACK )
                metalon( [ espessura_metalon, espessura_metalon ], profundidade_tampo_lateral );
}

rotate( 90, [ 0, 1, 0 ] )
    color( BLACK )
        #metalon( [ espessura_metalon, espessura_metalon ], distancia_tampo_lateral + espessura_tampo_lateral );
echo( distancia_tampo_lateral + espessura_tampo_lateral );
translate( [ 0, profundidade_tampo_lateral - espessura_metalon, 0 ] )
    rotate( 90, [ 0, 1, 0 ] )
        color( BLACK )
            metalon( [ espessura_metalon, espessura_metalon ], distancia_tampo_lateral + espessura_tampo_lateral );

translate( [ 0, 0, altura_tampo_lateral + espessura_metalon ] ) {
    rotate( 90, [ 0, 1, 0 ] )
        color( BLACK )
            metalon( [ espessura_metalon, espessura_metalon ], distancia_tampo_lateral + espessura_tampo_lateral );
    translate( [ 0, profundidade_tampo_lateral - espessura_metalon, 0 ] )
        rotate( 90, [ 0, 1, 0 ] )
            color( BLACK )
                metalon( [ espessura_metalon, espessura_metalon ], distancia_tampo_lateral + espessura_tampo_lateral );
}

translate( [ 0, espessura_metalon, altura_tampo_lateral ] )
    color( WHITE )
        cube( [ distancia_tampo_lateral + espessura_tampo_lateral, profundidade_tampo_lateral - 2 * espessura_metalon, espessura_tampo_lateral ] );

translate( [ espessura_tampo_lateral, profundidade_tampo_lateral - espessura_tampo_lateral, 0 ] )
    color( WHITE )
        cube( [ distancia_tampo_lateral - espessura_tampo_lateral, espessura_tampo_lateral, altura_tampo_lateral ] );