espatula_cmp_1 = 105;
espatula_cmp_2 = 35;
espatula_lar = 8;
espatula_alt = 13;
espatula_ang = 45;

chave_raio_od = 40;
chave_raio_id = 32;
chave_raio_alt = 13;

hex1_cmp_1 = 82;
hex1_cmp_2 = 32;
hex1_lar = 5.5;
hex1_alt = 5.5;
hex1_ang= 90;

obj_dist = 3.2;

gancheira_cmp = 60;
gancheira_lar = 45;
gancheira_alt = 9;

toolbox_width = 80;
toolbox_height = 145;
toolbox_length = max( chave_raio_alt, espatula_alt, gancheira_alt );

module chave( cmp_1, cmp_2, ang, lar, alt )
{
	cube( [ cmp_1, lar, alt ] );
	translate( [ cmp_1, 0, 0 ] )
		rotate( ang, [ 0, 0, 1 ] )
			cube( [ cmp_2, lar, alt ] );
}

module holes(){
	translate( [ 0, 0, -0.1 ] )
	{
		// Chave de raio:
		cylinder( h = chave_raio_alt + 0.1, r = chave_raio_od / 2, $fn = 100 );

		// Gancheira:
		translate( [ -chave_raio_od / 2, chave_raio_od / 2 + 5, 0 ] )
			cube( [ gancheira_lar, gancheira_cmp, gancheira_alt + 0.1  ] );

		// Espátulas:
		translate( [ -chave_raio_od / 2 - obj_dist - espatula_lar, espatula_cmp_1 - 18, 0 ] )
		rotate( -90, [ 0, 0, 1 ] )
			chave( cmp_1 = espatula_cmp_1, cmp_2 = espatula_cmp_2, ang = espatula_ang, lar = espatula_lar, alt = espatula_alt + 0.1 );
		translate( [ -chave_raio_od / 2 - 2 * obj_dist - 2 * espatula_lar, espatula_cmp_1 - 18 - obj_dist, 0 ] )
		rotate( -90, [ 0, 0, 1 ] )
			chave( cmp_1 = espatula_cmp_1, cmp_2 = espatula_cmp_2, ang = espatula_ang, lar = espatula_lar, alt = espatula_alt + 0.1 );
	}
}

difference(){
	cube( [ toolbox_width, toolbox_height, toolbox_length / 2 ] );
	translate( [ 70 - chave_raio_od / 2, 70 - chave_raio_od / 2, 0 ] )
		#holes();
}