
difference(){
    import( "XaxisNoMotor.stl", convexity = 10 );
    
    translate( [ -11, 11, -1 ] )
        cylinder( r = 4.3, h = 20, $fn = 50 );
    translate( [ -11, 11, 6 ] )
        cylinder( r = 5.3, h = 20, $fn = 50 );
}

end_stop_base_l = 18;
translate( [ 0, -end_stop_base_l, 0 ] )
{
    difference(){
        cube( [ 3, 20, 18 ] );
        
        translate( [ -1, ( end_stop_base_l - 10 ) / 2, 18 - 1.8 - 2 ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( r = 1.8, h = 10, $fn = 50 );
        translate( [ -1, ( end_stop_base_l - 10 ) / 2 + 10, 18 - 1.8 - 2 ] )
            rotate( 90, [ 0, 1, 0 ] )
                cylinder( r = 1.8, h = 10, $fn = 50 );
        
        translate( [ -8.5, -1, -1 ] )
            cube( [ 10, 20, 10 ] );
        
        translate( [ -12.2, -1, 12.7 ] )
            rotate( 60, [ 0, 1, 0 ] )
                cube( [ 10, 20, 10 ] );
    }
}
