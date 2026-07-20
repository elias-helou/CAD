height = 50;
large_l = 36.6;
small_l = 30.4;
lip_l = 3;
lip_h = 3;
post_height = 0;

difference(){
    union(){
        translate( [ - large_l / 2, - large_l / 2, 0 ] )
            cube( [ large_l, large_l, height + post_height ] );
        translate( [ - ( large_l + lip_l ) / 2, - ( large_l + lip_l ) / 2, 0 ] )
            cube( [ large_l + lip_l, large_l + lip_l, lip_h ] );
    }
    
    translate( [ - small_l / 2, - small_l / 2, -0.1 ] )
            cube( [ small_l, small_l, height + post_height + 0.2 ] );
}
