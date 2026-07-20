thickness = 17;
height = 60;
length = 100;

hole_dist = 3; // From border

head_d = 8;
screw_d = 4;
screw_h = 29;
tol = 0.5;

lip_height = 4;
lip_thickness = 3;

difference(){
    
    union(){
        cube( [ thickness + lip_thickness / 2, length, height ] );
        translate( [ thickness, 0, -lip_height ] )
            cube( [ lip_thickness, length, height + 2 * lip_height ] );
    }
    
    translate( [ thickness / 2, ( head_d + tol ) / 2 + hole_dist, screw_h ] )
        cylinder( d = head_d + tol, h = height, $fn = 50 );
    translate( [ thickness / 2, ( head_d + tol ) / 2 + hole_dist, -1 ] )
        cylinder( d = screw_d + tol, h = height + 2, $fn = 50 );
    
    translate( [ thickness / 2, length - ( head_d + tol ) / 2 - hole_dist, screw_h ] )
        cylinder( d = head_d + tol, h = height, $fn = 50 );
    translate( [ thickness / 2, length - ( head_d + tol ) / 2 - hole_dist, -1 ] )
        cylinder( d = screw_d + tol, h = height + 2, $fn = 50 );
}