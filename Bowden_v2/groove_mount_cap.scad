// Cube with rounded edges

el = 1e-2;
fn = 20;

module rcorner ( r )
{
   difference() {
      translate ( -el * [ 1, 1, 1 ] ) cube( r + el );
      translate ( [ r, r, r ] ) sphere( r, $fn = fn );
   }
}

module redge ( r, l )
{
   difference() {
      translate ( -2 * el * [ 1, 1, 1 ] ) cube( [ r + 2 * el, r + 2 * el, l + 4 * el ] );
      translate ( [ r, r, -el ] ) cylinder( r = r, h = l + 2 * el, $fn = fn );
   }
}

module rcube( size = 1, center = false, r = 0 )
{
        sz = len( size ) == undef ? [ size, size, size ] : size;

        difference() {
                cube( size = sz );
                union (){
                        // Round the edges:

                        redge( r ,sz[2] );
                        translate( [ sz[0], 0, 0 ] ) rotate( 90, [ 0, 0, 1 ] ) redge( r ,sz[2] );
                        translate( [ sz[0], sz[1], 0 ] ) rotate( 180, [ 0, 0, 1 ] ) redge( r ,sz[2] );
                        translate( [ 0, sz[1], 0 ] ) rotate( 270, [ 0, 0, 1 ] ) redge( r ,sz[2] );

                        translate( [ 0, sz[1], 0 ] ) rotate ( 90, [ 1, 0, 0 ] ) redge( r ,sz[1] );
                        translate( [ 0, 0, sz[2] ] ) rotate ( -90, [ 1, 0, 0 ] ) redge( r ,sz[1] );
                        translate( [ sz[0], 0, 0 ] ) rotate ( 180, [ 0, 1, 1 ] ) redge( r ,sz[1] );
                        translate( [ sz[0], sz[1], sz[2] ] ) rotate ( 180, [ 0, 1, -1 ] ) redge( r ,sz[1] );

                        translate( [ sz[0], 0, 0 ] ) rotate( -90, [ 0, 1, 0 ] )  redge( r ,sz[0] );
                        translate( [ 0, 0, sz[2] ] ) rotate( 90, [ 0, 1, 0 ] )  redge( r ,sz[0] );
                        translate( [ 0, sz[1], 0 ] ) rotate( 180, [ 1, 0, 1 ] )  redge( r ,sz[0] );
                        translate( [ sz[0], sz[1], sz[2] ] ) rotate( 180, [ 1, 0, -1 ] )  redge( r ,sz[0] );

                        // Round the corners:
                        rcorner( r );
                        translate( [ sz[0], 0, 0 ] ) rotate( 90, [ 0, 0, 1 ] ) rcorner( r );
                        translate( [ sz[0], sz[1], 0 ] ) rotate( 180, [ 0, 0, 1 ] ) rcorner( r );
                        translate( [ 0, sz[1], 0 ] ) rotate( 270, [ 0, 0, 1 ] ) rcorner( r );

                        translate( [ 0, 0, sz[2] ] ) rotate( 90, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );
                        translate( [ sz[0], 0, sz[2] ] ) rotate( 180, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );
                        translate( [ sz[0], sz[1], sz[2] ] ) rotate( 270, [ 0, 0, 1 ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );
                        translate( [ 0, sz[1], sz[2] ] ) rotate( 180, [ 1, 0, 0 ] ) rcorner( r );

                }
        }
}

delta = ( 35 - 23 ) / 2;
hole_rad = 2;
inner_hole = 35 - 3 * delta;

gm_hole_dist = 28;
pf_hole_dist = 25;
gm_attach_width = 35;
gm_cap_length = 22;

tol = 0.2;

// http://reprap.org/wiki/File:Jhn_nozzle_holder_v5.jpg
groove_inner_rad = ( 12 + tol ) / 2;
groove_rad = ( 15.875 + tol ) / 2;

render( convexity = 4 ){
    mirror () 
    {
        difference(){
            union(){
                difference(){
                    // Main body:
                    translate( [ 0, 0, -3 ] )
                        rcube( [ gm_attach_width, 15, gm_cap_length + 3 ], r = 2 );
                    // Remove main body bottom rounding:
                    translate( [ -0.1, 0, -5 ] )
                        cube( [ gm_attach_width + 0.2, 22, 5 ] );
                    // Fan duct hole:
                    translate( [ gm_attach_width / 2, 15 / 2, gm_cap_length + 0.1 - 5 ] ){
                        cylinder( h = 5.1, r = 5.3 / 2.0, $fn = 50 );
                        translate( [ 0, 0, -7 ] )
                            cylinder( h = 7, r2 = 4 / 2, r1 = 4 / 2 + 1.4, $fn = 50 );
                    }

                }
                    
                // Connection to induction sensor mount:
                translate( [ 5, 3, 0 ] )
                    rotate( 108.4, [ 0, 0, 1 ] )
                    {
                        rcube( [ 31.63, 5, 17 ], r = 2 );
                    }
            }
            // Groove mount:
            translate( [ gm_attach_width / 2, - 0.1, 0 ] ){
                rotate( -90, [ 1, 0, 0 ] ) {
                    cylinder( r = groove_inner_rad, h = 10 + 0.1, $fn = 50  );
                    cylinder( r = groove_rad, h = 4.76 + tol + 0.1, $fn = 50  );
                    translate( [ 0, 0, 4.76 + tol + 4.64 - tol + 0.1 ] )
                        cylinder( r = groove_rad, h = 4.76 + tol + 5, $fn = 50 );
                }
            }
    
            // Screw holes:
            translate( [ 0, 15 / 2, -0.1 ] )
            {
                translate( [ ( gm_attach_width - gm_hole_dist ) / 2, 0, 0 ] )
                    cylinder( h = gm_cap_length + 3 + 0.1, r = 4 / 2 + 0.8, $fn = 50 );
                translate( [ ( gm_attach_width + gm_hole_dist) / 2, 0, 0 ] )
                    cylinder( h = gm_cap_length + 3 + 0.1, r = 4 / 2 + 0.8, $fn = 50 );
            }
         }
        
        difference ()
        {
            // Induction sensor mount:
            translate( [ -35, 28, 0 ] )
                rcube( [ 30, 8, 25 ], r = 2 );
            
            // Induction sensor mount hole:
            translate( [ -20, 40, 12.5 ] )
                rotate( 90, [ 1, 0, 0 ] )
                    cylinder( h = 20.1, r = 9.4, $fn = 50 );
        }
    }
}
