with (instance_create_layer(880, 720, "Instances", obj_npc)) {
	movementDriver = new MovementDriver(
		id,
		spr_fghtr5_walk_up,
		spr_fghtr5_walk_down,
		spr_fghtr5_walk_left,
		spr_fghtr5_walk_right,
		1,
		0,
		2
	);	
}

with (instance_create_layer(700, 720, "Instances", obj_npc)) {
	movementDriver = new MovementDriver(
		id,
		spr_fghtr6_walk_up,
		spr_fghtr6_walk_down,
		spr_fghtr6_walk_left,
		spr_fghtr6_walk_right,
		1,
		0,
		2
	);	
}