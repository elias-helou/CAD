
difference(){

    union(){
        sphere( d = 18, $fn = 100 );
        cylinder( d = 7.6, $fn = 50, h = 9 + 7 );
    }
    
    translate( [ 0, 0, -30 ] )
        cylinder( d = 4.8, $fn = 50, h = 60 );
    
}
    