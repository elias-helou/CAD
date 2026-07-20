module ring( o_r, i_r, h )
{
    difference(){
        cylinder( r = o_r, h = h, $fn = 100 );
        translate( [ 0, 0, -1 ] )
            cylinder( r = i_r, h = h + 2, $fn = 100 );
    }
}

w = 15;
l = 40;
hole_w = 7;
hole_r = 3.5 / 2 + 0.2;
d = 2;

render( convexity = 10 ){
    
    difference(){
        cube( [ l, w, 7 ] );

        translate( [ l / 2, ( w - hole_w ) / 2, 15.25 ] )
            rotate( 90, [ 0, 0, 1 ] )
                rotate( 90, [ 0, 1, 0 ] )
                    ring( o_r = 15, i_r = 12.5, h = hole_w );
        
        translate( [ hole_r / 2 + d, w / 2, -1 ] )
            cylinder( r = hole_r, h = 9, $fn = 100 );
        translate( [ l - ( hole_r / 2 + d ), w / 2, -1 ] )
            cylinder( r = hole_r, h = 9, $fn = 100 );
    }    
}
