// Soma elementos de um vetor:
function add( v, i = 0, r = 0 ) = len( v ) > i ? add( v, i + 1, r + v[ i ] ) : r;

esc_dias = [ 15, 15, 15, 16, 15, 15, 18 ];
bro_dias = [  3,  4,  5,  6,  7,  8, 10 ];

// Tolerância nos furos:
tol = 1.0;
// Diâmetros nos furos:
diams = [ for( d = bro_dias ) d + tol ];

// Separação entre os furos:
sep = 2;

// Altura do porta-brocas:
h = 28;

// Excesso em largura:
el = 2;

// Largura do porta-brocas:
l = max( esc_dias ) * 0.8 + 2 * el;

// Comprimento do porta-brocas:
c = add( esc_dias ) + sep * ( len( esc_dias ) + 1 );

// Ângulo das brocas:
a = 10;

difference(){
    translate( [ 0, 0, -sin( a ) * l ] )
        rotate( a, [ 1, 0, 0 ] )
            difference(){
                cube( [ c, l, h ] );
                for( i = [ 0 : len( diams ) - 1 ] )
                {
                    translate(
                        [
                            ( i + 1 ) * sep + add( [ for( j = [ 0 : i ] ) esc_dias[ j ] ] ) - esc_dias[ i ] / 2,
                            l / 2,
                            -1
                        ]
                    )
                        cylinder( d = diams[ i ], h = 3 * h, $fn = 30 );
                }
            }
    translate( [ -500, -500, -100 ] )
    cube( [ 1000, 1000, 100 ] );
}

aba_l = 10;
module aba()
{
    difference()
    {
        cube( [ aba_l + 3, 3, h ] );
        translate( [ aba_l / 2, 15, h / 2 ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( d = 4, h = 30, $fn = 20 );
    }
    translate( [ aba_l, -4, 0 ] )
        cube( [ 3, 7, h ] );
}
translate( [ -aba_l, l - 3, 0 ] )
    aba();
translate( [ c + aba_l, l - 3, 0 ] )
    mirror( [ 1, 0, 0 ] )
        aba();
