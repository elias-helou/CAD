module half_torus( r1, r2, h = 0 ){
    translate( [ 0, 0, r1 ] )
        rotate_extrude( convexity = 10, $fn = $fn )
            translate( [ r2, 0, 0 ] )
                circle( r = r1, $fn = $fn );
    translate( [ 0, 0, r1 ] )
        rotate_extrude( convexity = 10, $fn = $fn )
            translate( [ r2 - r1, 0, 0 ] )
                square( [ r1 * 2, r1 * 2  + h ] );
}

inner_d = 50;
outer_d = 56.1;

wall_t = 7;

wire_d = 3.3;

top_w = 20;
top_x = 5;

para_d = 4.5;
cabe_d = 9.4;
cabe_h = 4.4;

difference(){
    union(){
        cylinder( d = outer_d + 2 * wall_t, h = wire_d + wall_t, $fn = 100 );
        translate( [ 0, -( outer_d + 2 * wall_t ) / 2, 0 ] )
            cube( [ ( outer_d + 2 * wall_t ) / 2, outer_d + 2 * wall_t, wire_d + wall_t ] );
    }
    
    translate( [ 0, 0, wall_t - 1 ] )
        half_torus( ( wire_d + 1 ) / 2, ( outer_d + wire_d / 2 ) / 2, 5, $fn = 100);
    
    translate( [ 0, ( outer_d + wire_d / 2 ) / 2, ( wire_d + 1 ) / 2 + wall_t - 1 ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d = wire_d + 1, h = 100, $fn = 100 );
    
    translate( [ 0, ( outer_d + wire_d / 2 ) / 2 - ( wire_d + 1 ) / 2, ( wire_d + 1 ) / 2 + wall_t - 1 ] )
        cube( [ 100, wire_d + 1, 100 ] );

    translate( [ 0, -( outer_d + wire_d / 2 ) / 2, ( wire_d + 1 ) / 2 + wall_t - 1 ] )
        rotate( 90, [ 0, 1, 0 ] )
            cylinder( d = wire_d + 1, h = 100, $fn = 100 );
    
    translate( [ 0, -( outer_d + wire_d / 2 ) / 2 - ( wire_d + 1 ) / 2, ( wire_d + 1 ) / 2 + wall_t - 1 ] )
        cube( [ 100, wire_d + 1, 100 ] );
    
    translate( [ -100 - top_x, top_w / 2, -1 ] )
        cube( [ 100, 100, 100 ] );

    translate( [ -100 - top_x, -100 - top_w / 2, -1 ] )
        cube( [ 100, 100, 100 ] );


    translate( [ 10, -50, -1 ] )
        cube( [ 100, 100, 100 ] );
        
    translate( [ -15, 0, -1 ] )
        cylinder( d = para_d, h = 100, $fn = 50 );
    translate( [ -15, 0, -1e-3 ] )
        cylinder( d2 = para_d, d1 = cabe_d, h = cabe_h, $fn = 50 );
}