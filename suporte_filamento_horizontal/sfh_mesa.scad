h = 5;
r = 50;
delta = 5.6;

N = 5;

difference() {

    union(){
        cylinder( r = r, h = h, $fn = 100 );
        for ( a = [ 0 : N - 1 ] ) {
            rotate( 360 / N * a, [ 0, 0, 1 ] ) {
                translate( [ 0, r - ( 5 + 3 - 1 ), h / 2 + delta ] )
                    rotate( 90, [ 1, 0, 0 ] )
                        cylinder( r = 4, h = 40 + 1, $fn = 100 );
            }
        }
    }

    translate( [ 0, 0, -1 ] )
        cylinder( r = 5, h = h + 30, $fn = 100 );
    
    for ( a = [ 0 : N - 1 ] ) {
        rotate( 360 / N * a, [ 0, 0, 1 ] ) {
            translate( [ 0, r, h / 2 + delta ] )
                rotate( 90, [ 1, 0, 0 ] )
                    cylinder( r = 8, h = 5 + 3, ,$fn = 160 );
            translate( [ 0, r - ( 5 + 3 - 1 ), h / 2 + delta ] )
                rotate( 90, [ 1, 0, 0 ] )
                    cylinder( r = 2.1, h = 40 + 1, $fn = 100 );
        }
    }
}
//for ( a = [ 0 : N - 1 ] ) {
//    rotate( 360 / N * a, [ 0, 0, 1 ] ) {
//        difference() {
//        translate( [ 0, r - 3 + 1, h / 2 + delta ] )
//            rotate( 90, [ 1, 0, 0 ] )
//                cylinder( r = 6.5, h = 5, ,$fn = 160 );
//        translate( [ 0, r, h / 2 + delta ] )
//            rotate( 90, [ 1, 0, 0 ] )
//                cylinder( r = 2.1, h = 40 + 1, $fn = 100 );
//        }
//    }
//}