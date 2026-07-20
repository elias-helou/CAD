module round_rec( v, r, center = false, fn = 50 ){

//    cube( v, center = center );
    
    delta_x = center ? -v[ 0 ] / 2 : 0;
    delta_y = center ? -v[ 1 ] / 2 : 0;
    
    linear_extrude( height = v[ 2 ], center = center )
        polygon(
            points = [
                for ( i = [ 0 : fn - 1 ] )
                    [ r * cos( -180 + i / fn * 90 ) + r + delta_x, r * sin( -180 + i / fn * 90 ) + r + delta_y ],
                [ r + delta_x, 0 + delta_y ],
                for ( i = [ 0 : fn - 1 ] )
                    [ r * cos( -90 + i / fn * 90 ) + v[ 0 ] - r + delta_x, r * sin( -90 + i / fn * 90 ) + r + delta_y ],
                [ v[ 0 ] + delta_x, r + delta_y ],
                for ( i = [ 0 : fn - 1 ] )
                    [ r * cos( i / fn * 90 ) + v[ 0 ] - r + delta_x, r * sin( i / fn * 90 ) + v[ 1 ] - r + delta_y ],
                [ v[ 0 ] - r + delta_x, v[ 1 ] + delta_y ],
                for ( i = [ 0 : fn - 1 ] )
                    [ r * cos( 90 + i / fn * 90 ) + r + delta_x, r * sin( 90 + i / fn * 90 ) + v[ 1 ] - r + delta_y ],
                [ 0 + delta_x, r + delta_y ]
            ]
        );

}

difference(){
    round_rec( [ 100, 50, 10 ], 10, center = true );
    cube( [ 60, 5, 500 ], center = true );
}