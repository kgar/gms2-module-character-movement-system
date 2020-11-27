movementDriver = undefined;
seq_state_machine_create([
	{ 
		state: ai_action_do_nothing,
		props: ai_action_do_nothing_props("Hello, initialized world!")
	}
]);
walkSpeed = 1;