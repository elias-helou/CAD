d = 8;
dd = 2;
wall = 2 * 2;
h = 15;

module unit(){
    
    difference(){

        union(){
            translate( [ -2, 0, 0 ] )
                rotate( 15, [ 0, 1, 0 ] )
                    translate( [ d / 2 + dd, d / 2 + dd, 5 ] )
                        difference(){       
                            translate( [ 0, 0, -10 ] )
                                cylinder( h = h + 10, d = d + wall, $fn = 6 );
                            cylinder( h = h + 1, d = d, $fn = 6 );
                        }
        
            translate( [ 0, 0, -1 ] )
                cube( [ d + 2 * dd, d + 2 * dd, 2 + 1 ] );

        }
        translate( [ -25, -25, -100 ] )
            cube( [ d + 2 * dd + 50, d + 50 * dd + 2, 100 ] );
    }
}

translate( [ 0 * ( d + 2 * dd ), 0, 0 ] )
{
    unit();
        translate( [ 0, d + 2 * dd, 0 ] )
            unit();

}translate( [ 1 * ( d + 2 * dd ), 0, 0 ] )
{
    unit();
        translate( [ 0, d + 2 * dd, 0 ] )
            unit();

}
translate( [ 2 * ( d + 2 * dd ), 0, 0 ] )
{
    unit();
        translate( [ 0, d + 2 * dd, 0 ] )
            unit();

}

difference(){
    union(){
        translate( [ 0, ( d + 2 * dd ), -1 ] )
            cylinder( d = 2 * ( d + 2 * dd ), h = 2 + 1, $fn = 50 );
        translate( [ 3 * ( d + 2 * dd ), ( d + 2 * dd ), -1 ] )
            cylinder( d = 2 * ( d + 2 * dd ), h = 2 + 1, $fn = 50 );
    }
    
    translate( [ -100, -100, -50 ] )
        cube( [ 200, 200, 50 ] );        

    translate( [ -6, ( d + 2 * dd ), -1 ] )
        cylinder( d = 4, h = 2 + 2, $fn = 50 );
    translate( [ 3 * ( d + 2 * dd )  + 6, ( d + 2 * dd ), -1 ] )
        cylinder( d = 4, h = 2 + 2, $fn = 50 );
}