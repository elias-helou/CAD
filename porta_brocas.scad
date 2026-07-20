// Soma elementos de um vetor:
function add( v, i = 0, r = 0 ) = len( v ) > i ? add( v, i + 1, r + v[ i ] ) : r;

//Diâmetros das brocas:
diams_orig = [ 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3 ];
// Tolerância:
tol = 0.5;
diams = [ for( d = diams_orig ) d + tol ];
// Separação entre os furos:
sep = 2;
// Altura do porta-brocas:
h = 15;
// Excesso em largura:
el = 4;
// Largura do porta-brocas:
l = max( diams ) + 2 * el;
// Comprimento do porta-brocas:
c = add( diams ) + sep * ( len( diams ) - 1 );
// Ângulo das brocas:
a = 10;

difference(){
    cube( [ c, l, h ] );
    for( i = [ 0 : len( diams ) - 1 ] )
    {
        translate(
            [
                ( i + 1 ) * sep + add( [ for( j = [ 0 : i ] ) diams[ j ] ] ) - diams[ 0 ] / 2,
                l / 2,
                2
            ]
        )
            rotate( a, [ 1, 0, 0 ] )
                cylinder( d = diams[ i ], h = 3 * h, $fn = 30 );
        echo( diams[ i ] );
    }
    rotate( a, [ 1, 0, 0 ] )
    translate( [ -10, -100 + 3, -1 ] )
        cube( [ 20 + c, 100, 100 ] );
}

aba_l = 10;
module aba()
{
    difference()
    {
        cube( [ aba_l + 1, 3, h ] );
        translate( [ aba_l / 2, 15, h / 2 ] )
            rotate( 90, [ 1, 0, 0 ] )
                cylinder( d = 4, h = 30, $fn = 20 );
    }
}
translate( [ -aba_l, l - 3, 0 ] )
    aba();
translate( [ c + aba_l, l - 3, 0 ] )
    mirror( [ 1, 0, 0 ] )
        aba();
