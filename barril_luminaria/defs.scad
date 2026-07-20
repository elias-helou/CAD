N_conexao = 36;
theta_h = 360 / N_conexao;
theta_v = 130;
d_conexao = 38;
d_inner_conexao = 20;
h_cunha = ( tan( theta_h / 2 ) * d_conexao ) / ( 2 * tan( theta_v / 2 ) );
bottom_conexao = 1;
eixo_conexao = 6;
tol_conexao = 0.25;

d_top_pescoco = 33;
d_bottom_pescoco = 35;
d_hole = 3;

wall_pescoco = 4;
bottom_wall_pescoco = 4;

height_pescoco = 43;

tol_pescoco = 1;

angulo_pescm = 0;
thick_pescm = 8;
h_pescm = 30;
thick_base_pescm = 4;
del_pescm = 5;

r_hole = ( d_inner_conexao + ( d_conexao - d_inner_conexao ) / 2 ) / 2;

p_barril = 510;
d_barril = p_barril / 3.14;
lip_barril = 12;
wall_conn_pescs = 12 * 2;
length_conn_pescs = 110;
N_par_barril = 4;
del_par_barril = 5;
d_par_barril = 3;
thick_pescs = 10;
dist_pescs = 3;
width_pescs = 25;
tol_pescs = 0.4;

d_plug = 12;
pos_plug = 0.5;
plug_brack_h = 2.5;
plug_brack_w = 4.5;
angle_plug = 360 * ( d_plug + plug_brack_h ) / ( 3.14 * ( d_barril + wall_conn_pescs / 2 ) );
