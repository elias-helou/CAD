r = 9;
h = 15;
d = 20;

N = 4;

walls = 2;

angle = 15;

diag =  2 * ( r + walls ) * cos( angle );
diag_h =  2 * ( r + walls ) * sin( angle );

module holder() {
    rotate( angle, [ 1, 0, 0 ] )
        difference(){
            cylinder( d = 2 * ( r + walls ), h = h + walls, $fn = 50 );
            translate( [ 0, 0, walls ] )
                cylinder( d = 2 * r, h = h + walls, $fn = 50 );
        }
}
module holder_full() {
    rotate( angle, [ 1, 0, 0 ] )
        cylinder( d = 2 * ( r + walls + 10 ), h = 100, $fn = 50 );
}

for ( i = [ 0 : N - 1 ] ){
    translate( [ i * d, 0, 0 ] )
        holder();
}

for ( i = [ 0 : N - 1 ] ){
    translate( [ i * d, 0, 0 ] )
    difference(){
        translate( [ 0, 0, -diag_h / 2 ] )
        scale( [ 1, cos( angle ), 1 ] )
            cylinder( d = 2 * ( r + walls ), h = diag_h, $fn = 50 );
        holder_full();
    }
}
