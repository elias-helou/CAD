include <defs.scad>

module pescoco(){

    difference(){
        
        cylinder(
            d1 = d_top_pescoco + wall_pescoco + tol_pescoco,
            d2 = d_bottom_pescoco + wall_pescoco + tol_pescoco,
            h = height_pescoco,
            $fn = 100
        );
        
        translate( [ 0, 0, -1e-3 ] )
            cylinder(
                d1 = d_top_pescoco + tol_pescoco,
                d2 = d_bottom_pescoco + tol_pescoco,
                h = height_pescoco + 2e-3,
                $fn = 100
            );
        
    }
    difference(){
        translate( [ 0, 0, -wall_pescoco ] )
            cylinder(
                d = d_top_pescoco + wall_pescoco + tol_pescoco,
                h = wall_pescoco + 1e-3,
                $fn = 100
            );
        translate( [ 0, 0, -wall_pescoco - 1 ] )
            cylinder(
                d = d_hole,
                h = wall_pescoco + 100,
                $fn = 100
            );
    }
}

pescoco();