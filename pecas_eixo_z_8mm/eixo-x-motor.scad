render( convexity = 10 ){
    union(){
        difference(){
            import( "XaxisWithMotor_new.stl", convexity = 10 );
        
//            translate( [ -5.01, 40, -1 ] ) cube( [ 6.5, 30, 22 ] );
        }
//        translate( [ -11, 37.9, 0 ] )
//            cylinder( r = 2.6, h = 8, $fn = 100 );
//        translate( [ -11, 21.9, 0 ] )
//            cylinder( r = 2.6, h = 8, $fn = 100 );
    }
}
