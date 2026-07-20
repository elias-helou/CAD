bottom_h = 1;
d = 180;
wall_t = 3;
wall_h = 11;

hole_t = 5;

M = 19;

function p_compute( c, l, t, theta ) = [
    c[ 0 ] + 0.5 * ( l * cos( theta ) + t * sin( theta ) ),
    c[ 1 ] + 0.5 * ( l * sin( theta ) - t * cos( theta ) )
];

function d_compute( c, l, t, r, theta ) = 
    let( v = p_compute( c, l, t, theta ) )
        v[ 0 ] * v[ 0 ] + v[ 1 ] * v[ 1 ] - r * r;
        
function theta_compute( c, l, t, r, theta_0, theta_1 ) =
    abs( theta_0 - theta_1 ) <= 1e-6 ? theta_1 :
        let(
             f_0 = d_compute( c, l, t, r, theta_0 ),
             f_1 = d_compute( c, l, t, r, theta_1 )
           )
            theta_compute( c, l, t, r, theta_1, theta_1 - f_1 * ( theta_1 - theta_0 ) / ( f_1 - f_0 ) );
            
l = M * wall_t;
c = [ d / 2 + wall_t / 2, 0 ];
t = hole_t;
r = d / 2;

theta = theta_compute( c, l, t, r, 90, 89 );
echo( theta );

difference(){
    cylinder( d = d + 2 * wall_t, h = bottom_h + wall_h, $fn = 100 );
    translate( [ 0, 0, bottom_h ] )
        cylinder( d = d, h = bottom_h + wall_h, $fn = 100 );
    

    translate( [ c[ 0 ], 0, 0 ] )
        rotate( -theta, [ 0, 0, 1 ] )
            translate( [ -l / 2, -hole_t / 2, bottom_h ] )
                cube( [ l, hole_t, wall_h + 1 ] );
}
