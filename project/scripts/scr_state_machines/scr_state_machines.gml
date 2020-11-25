function seq_state_machine_create(states){
	seq_state_machine_states = states;
	seq_state_machine_index = 0;
	
	return seq_state_machine_step;
}

function seq_state_machine_step() {
	var action = seq_state_machine_states[seq_state_machine_index];
	
	if (action() == StateProgress.Continue) {
		index = (index + 1) % array_length(seq_state_machine_states);
	}
}

/// @description   Create the necessary instance fields for an unmanaged state machine, where the states themselves dictate the next state.
/// @param states  The states to execute
/// @param state*  Optional starting state, else will be 0.
function unmanaged_state_machine_create(states) {
	unmanaged_state_machine_states = states;
	
	unmanaged_state_machine_index = argument_count > 1
		? argument[1]
		: 0;
	
	return unmanaged_state_machine_step;
}

function unmanaged_state_machine_step() {
	var action = unmanaged_state_machine_states[unmanaged_state_machine_index];
	
	unmanaged_state_machine_index = action();
}

enum StateProgress {
	Continue,
	Transition
}