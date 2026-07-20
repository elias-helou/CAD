h = 5;
r = 50;
delta = 5.6;

N = 5;

//difference() {
//
//    union(){
//        cylinder( r = r, h = h, $fn = 100 );
//        for ( a = [ 0 : N - 1 ] ) {
//            rotate( 360 / N * a, [ 0, 0, 1 ] ) {
//                translate( [ 0, r - ( 5 + 3 - 1 ), h / 2 + delta ] )
//                    rotate( 90, [ 1, 0, 0 ] )
//                        cylinder( r = 4, h = 40 + 1, $fn = 100 );
//            }
//        }
//    }
//
//    translate( [ 0, 0, -1 ] )
//        cylinder( r = 5, h = h + 30, $fn = 100 );
//    
//    for ( a = [ 0 : N - 1 ] ) {
//        rotate( 360 / N * a, [ 0, 0, 1 ] ) {
//            translate( [ 0, r, h / 2 + delta ] )
//                rotate( 90, [ 1, 0, 0 ] )
//                    cylinder( r = 8, h = 5 + 3, ,$fn = 160 );
//            translate( [ 0, r - ( 5 + 3 - 1 ), h / 2 + delta ] )
//                rotate( 90, [ 1, 0, 0 ] )
//                    cylinder( r = 2.1, h = 40 + 1, $fn = 100 );
//        }
//    }
//}
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

difference(){
    translate( [ 0, 0, h / 2 + delta + 6.5 - 2 ] )
        cylinder( r = 50, h = 15, $fn = 100 );
    translate( [ 0, 0, h / 2 + delta + 6.5 - 2 - 8 ] )
        cylinder( r = 50 - 0.96, h = 10, $fn = 100 );
    cylinder( r = 50 - 10, h = 100, $fn = 100 );
    for ( a = [ 0 : N - 1 ] ) {
        rotate( 360 / N * a, [ 0, 0, 1 ] ) {
            translate( [ -2.5, 0, h / 2 + delta + 6.5 + 3 ] )
                cube( [ 5, 60, 5 ] );
        }
    }
}

difference(){
    union(){
        translate( [ 0, 0, h / 2 + delta + 6.5 - 2 ] )
            cylinder( r = 13.7 + 5, h = 15, $fn = 100 );
        for ( a = [ 0 : N - 1 ] ) {
            rotate( 360 / N * a + 180 / N, [ 0, 0, 1 ] ) {
                translate( [ -2.5, 0, h / 2 + delta + 6.5 + 8 ] )
                    cube( [ 5, 45, 5 ] );
            }
        }
    }
    translate( [ 0, 0, h / 2 + delta + 6.5 - 2 - 1 ] )
        cylinder( r = 13.7, h = 8 + 1, $fn = 100 );
    cylinder( r = 6, h = 100, $fn = 100 );
}















