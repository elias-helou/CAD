dist = 20;
l_1 = 10;
l_2 = 5;
d_1 = 2 * ( dist - l_1 );
d_2 = l_1 + l_2 + d_1;
w = 25;
m = 2;
h = 15;

he_room = 4;
he_d = 9;
h_d = 5;

s = 20 / d_2;

difference(){
    union(){
        difference(){
            union(){
                translate( [ 0, d_2 / 2, 0 ] )
                scale( [ s, 1, 1 ] )
                    cylinder( d = d_2, h = w, $fn = 100 );
                
                cube( [ d_2 / 2, l_1, w ] );
        
            }
            
            translate( [ 0, l_1 + d_1 / 2, -1 ] )
            scale( [ s, 1, 1 ] )
                cylinder( d = d_1, h = w + 2, $fn = 100 );    
            translate( [ 0, l_1, -1 ] )
                cube( [ 100, 100, w + 2 ] );
            translate( [ h, -1, -1 ] )
                cube( [ 100, 100, 100 ] );
        }
        
        translate( [ h, l_1 / 2, 0 ] )
            cylinder( d = l_1, h = w, $fn = 100 );
        translate( [ 0, l_1 + d_1 + l_2 / 2, 0 ] )
            cylinder( d = l_2, h = w, $fn = 100 );
    }
    
    translate( [ ( h + l_1 / 2 ) / 2, 50, w / 2 ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( d = h_d, h = 100, $fn = 100 );

    translate( [ ( h + l_1 / 2 ) / 2, 100 + ( l_1 - he_room ), w / 2 ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( d = he_d, h = 100, $fn = 100 );
}