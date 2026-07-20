tol = 0.8;
wall_thickness = 2.6;
small_dropout_height = 5.1;
dropout_length = 54;
dropout_width = 41;
dropout_height = 9.3;
allen_length = 85;
allen_width = 32.2;
allen_height = 5.7;
multitool_length = 78;
multitool_width = 40;
multitool_height = 15.5;
object_skip = 0.5;
base_height = small_dropout_height + allen_height + multitool_height + wall_thickness + 2 * object_skip + 0.1;
full_width = dropout_width + 2 * wall_thickness;
full_length = allen_length + 2 * wall_thickness;
guide_wall_width = 1.2;
guide_wall_height = 2;

module bottom() {
	difference() {
		cube( [ full_length, full_width, base_height ] );
		translate( [ ( full_length - dropout_length - tol ) / 2, ( full_width - dropout_width - tol ) / 2, wall_thickness ] ) {
			cube( [ dropout_length + tol, dropout_width + tol, base_height ] );
		}
		translate( [ ( full_length - allen_length - tol ) / 2, ( full_width - allen_width - tol ) / 2, wall_thickness + small_dropout_height + object_skip ] ) {
			cube( [ allen_length + tol, allen_width + tol, base_height ] );
		}
		translate( [ ( full_length - multitool_length - tol ) / 2, ( full_width - multitool_width - tol ) / 2, wall_thickness + small_dropout_height + allen_height + 2 * object_skip ] ) {
			cube( [ multitool_length + tol, multitool_width + tol, base_height ] );
		}
	}
	difference() {
		translate( [ 0, 0, base_height ] ) {
			cube( [ full_length, full_width, guide_wall_height ] );
		}
		translate( [ guide_wall_width, guide_wall_width, base_height - 0.1 ] ) {
			cube( [ full_length - 2 * guide_wall_width, full_width - 2 * guide_wall_width, guide_wall_height + 0.2 ] );
		}
	}
	half_diameter = 50;
	difference() {
		translate( [ 0, 0, -5 ] )
			cube( [ full_length, full_width, 5 ] );
		translate( [ -0.1, full_width / 2, -half_diameter ] )
			rotate( 90, [ 0, 1, 0 ] )
				cylinder( r = half_diameter, h = 110, $fn = 50 );
	}
}

lube_length = 83;
lube_body_length = 54;
lube_width = 39;
lube_height = 19;
removed_width = 2 * guide_wall_width + tol;
stripe_width = 20;
stripe_height = 1;
module top() {
	difference() {
		translate( [ 0, 0, base_height ] )
			cube( [ full_length, full_width, lube_height + wall_thickness ] );
		translate( [ ( full_length - lube_length - tol ) / 2, ( full_width - lube_width - tol ) / 2, base_height - 0.1 ] )
			cube( [ lube_length + tol, lube_width + tol, lube_height + 0.1 ] );
	
		difference() {
			translate( [ -0.1, -0.1, base_height - 0.01 ] )
					cube( [ full_length + 0.2, full_width + 0.2, guide_wall_height + 0.01 ] );
			translate( [ removed_width / 2, removed_width / 2, base_height - 0.1 ] )
					cube( [ full_length - removed_width, full_width - removed_width, guide_wall_height + 0.1 ] );
		}
	}

	translate( [ 5, -stripe_height, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );
	translate( [ 5 + stripe_width, -stripe_height, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );

	translate( [ 5, full_width, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );
	translate( [ 5 + stripe_width, full_width, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );

	translate( [ full_length - 10, -stripe_height, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );
	translate( [ full_length - 10 - stripe_width, -stripe_height, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );

	translate( [ full_length - 10, full_width, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );
	translate( [ full_length - 10 - stripe_width, full_width, base_height + lube_height + wall_thickness - 10 ] )
		cube( [ 5, stripe_height, 10 ] );
}

//translate( [ 0, 0, 3 ] )
top();
//bottom();