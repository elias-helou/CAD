outer_length = 42.5 + 0.5;
chanfer_length = 13;
height = 28;
hole_dist = 4.5;

module shape( outer_length, chanfer_length, height ) {
    linear_extrude( height )
        polygon(
            [
                [ -outer_length / 2, -outer_length / 2 + chanfer_length / 2 ],
                [ -outer_length / 2 + chanfer_length / 2, -outer_length / 2 ],
                [  outer_length / 2 - chanfer_length / 2, -outer_length / 2 ],
                [  outer_length / 2, -outer_length / 2 + chanfer_length / 2 ],
                [  outer_length / 2,  outer_length / 2 - chanfer_length / 2 ],
                [  outer_length / 2 - chanfer_length / 2,  outer_length / 2 ],
                [ -outer_length / 2 + chanfer_length / 2, outer_length / 2 ],
                [ -outer_length / 2, outer_length / 2 - chanfer_length / 2 ]
            ]
        );
}

difference(){
    union(){
        rotate( -45, [ 0, 0, 1 ] )
            shape( outer_length + 6, chanfer_length, height );
        difference(){
            translate( [ 10, -50, 0 ] )
                cube( [ 20, 50, height ] );
            translate( [ 0, -45, -1 ] )
                cube( [ 100, 10, 2 *  hole_dist + 1 ] );
            translate( [ 0, my_radius - 45, 2 * hole_dist  ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = my_radius, h = 100, $fn = 100 );
            translate( [ 0, -45 + my_radius, -1 ] )
                cube( [ 100, 100, 2 *  hole_dist + 1 + my_radius ] );
        
            translate( [ 0, -45, height - 2 *  hole_dist ] )
                cube( [ 100, 10, 2 *  hole_dist + 1 ] );
            translate( [ 0, my_radius - 45, height - 2 * hole_dist  ] )
                rotate( 90, [ 0, 1, 0 ] )
                    cylinder( r = my_radius, h = 100, $fn = 100 );
            translate( [ 0, -45 + my_radius, height - 2 * hole_dist - my_radius ] )
                cube( [ 100, 100, 2 *  hole_dist + 1 + my_radius ] );
        }        
}
    rotate( -45, [ 0, 0, 1 ] )
        translate( [ 0, 0, -1 ] )
            shape( outer_length, chanfer_length - 4, height + 2 );
    rotate( -45, [ 0, 0, 1 ] )
        translate( [ 0, 50, height / 2 ] )
            cube( [ outer_length - 3, 100, height + 2 ], center = true );
    
    translate( [ 20, -44, hole_dist  ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( r = 2, h = 10, $fn = 100 );
    translate( [ 20, 0, hole_dist  ] )
        rotate( 90, [ 1, 0, 0 ] )
             cylinder( r = 2.8, h = 25, $fn = 100 );

    translate( [ 20, -44, height - hole_dist  ] )
        rotate( 90, [ 1, 0, 0 ] )
             cylinder( r = 2, h = 10, $fn = 100 );
    translate( [ 20, 0, height - hole_dist  ] )
        rotate( 90, [ 1, 0, 0 ] )
            cylinder( r = 2.8, h = 25, $fn = 100 );
    }

my_radius = 2;
