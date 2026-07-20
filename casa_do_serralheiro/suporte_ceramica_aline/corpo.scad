block_h = 124.4 + 0.5;
block_w = 38.2 + 0.5;
block_t = 7;

wall_w = 3;

column_w_s = 0.5;

translate( [ -( block_w * column_w_s ) / 2, 0, 0 ] )
    cube( [ block_w * column_w_s, block_h + 2 * wall_w, wall_w ] );
translate( [ -( block_w + 2 * wall_w ) / 2, 0, 0 ] )
    cube( [ block_w + 2 * wall_w, wall_w, block_t + wall_w ] );
translate( [ -( block_w + 2 * wall_w ) / 2, block_h + wall_w, 0 ] )
    cube( [ block_w + 2 * wall_w, wall_w, block_t + wall_w ] );
 
translate( [ -( block_w + 2 * wall_w ) / 2, 0, 0 ] ) 
    cube( [ wall_w, 2 * wall_w, block_t + wall_w ] );
translate( [ block_w / 2, 0, 0 ] ) 
    cube( [ wall_w, 2 * wall_w, block_t + wall_w ] );
    
translate( [ -( block_w + 2 * wall_w ) / 2, block_h, 0 ] ) 
    cube( [ wall_w, 2 * wall_w, block_t + wall_w ] );
translate( [ block_w / 2, block_h, 0 ] ) 
    cube( [ wall_w, 2 * wall_w, block_t + wall_w ] );
