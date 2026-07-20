// Dimensões da base:
h_b = 50;
w_b = 70;
l_b = 5.5;

// Dimensões do suporte do ventilador:
h_s = 12;
h_dist = 40;
w_s = 50;
p_s = 6.8;
t_s = -75;

render( convexity = 10 ){
    
    // Base:
    difference(){
        cube( [ w_b + 2 * l_b, l_b, h_b + l_b ] );
        translate( [ l_b, -1, -1 ] )
            cube( [ w_b, l_b + 2, h_b + 1 ] );
        
        translate( [ 0, 0, h_b + l_b ] )
            rotate( t_s, [ 1, 0, 0 ] )
                translate( [ ( w_b + 2 * l_b - w_s ) / 2, 0, 0 ] ){
                        translate( [ ( w_s - h_dist ) / 2, h_s + 1, h_s / 2 ] )
                            rotate( 90, [ 1, 0, 0 ] )
                                cylinder( r = 1.8, h = h_s + 2, $fn = 20 );
                        translate( [ w_s - ( w_s - h_dist ) / 2, h_s + 1, h_s / 2 ] )
                            rotate( 90, [ 1, 0, 0 ] )
                                cylinder( r = 1.8, h = h_s + 2, $fn = 20 );
                        translate( [ w_s - h_dist, -1, 4.5 ] )
                            cube( [ h_dist - 2 * ( w_s - h_dist ) / 2, h_s, 20 ] );
                    }
    }
    
    // Suporte do ventilador:
    difference(){
        translate( [ 0, 0, h_b + l_b ] )
            rotate( t_s, [ 1, 0, 0 ] )
                translate( [ ( w_b + 2 * l_b - w_s ) / 2, 0, 0 ] )
                    difference(){
                        cube( [ w_s, p_s, h_s ] );
    
                        translate( [ ( w_s - h_dist ) / 2, h_s + 1, h_s / 2 ] )
                            rotate( 90, [ 1, 0, 0 ] )
                                cylinder( r = 1.8, h = h_s + 2, $fn = 20 );
                        translate( [ w_s - ( w_s - h_dist ) / 2, h_s + 1, h_s / 2 ] )
                            rotate( 90, [ 1, 0, 0 ] )
                                cylinder( r = 1.8, h = h_s + 2, $fn = 20 );
                        
                        translate( [ w_s - h_dist, -1, 4.5 ] )
                            cube( [ h_dist - 2 * ( w_s - h_dist ) / 2, h_s, 20 ] );
                    }
            translate( [ l_b, -1, -1 ] )
                cube( [ w_b, l_b + 2, h_b + 1 ] );
    }
    
    // Bases de parafusamento:
    translate( [ - l_b + 1, 0, 0 ] )
        difference(){
            union(){
                cube( [ 3.6 + 5, l_b, 4 ] );
                translate( [ 0, l_b  / 2, 0 ] )
                    cylinder( r = l_b / 2, h = 4, $fn = 20 );
            }
            translate( [ 0, l_b  / 2, -1 ] )
                cylinder( r = 1.8, h = 6, $fn = 20 );
        }

    translate( [ w_b + 2 * l_b, 0, 0 ] )
    mirror( [ 1, 0, 0 ] )
    translate( [ - l_b + 1, 0, 0 ] )
        difference(){
            union(){
                cube( [ 3.6 + 5, l_b, 4 ] );
                translate( [ 0, l_b  / 2, 0 ] )
                    cylinder( r = l_b / 2, h = 4, $fn = 20 );
            }
            translate( [ 0, l_b  / 2, -1 ] )
                cylinder( r = 1.8, h = 6, $fn = 20 );
        }

}