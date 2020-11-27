function seq_state_machine_create(params){
	var length = array_length(params);
	seq_state_machine_states = array_create(length);
	seq_state_machine_props = array_create(length);
	seq_state_machine_index = 0;
	
	for (var i = 0; i < length; i++) {
		var param = params[i];
		seq_state_machine_states[i] = variable_struct_get(param, "state");
		seq_state_machine_props[i] = variable_struct_get(param, "props");
	}
	
	state_machine_events_apply(seq_state_machine_step, undefined);
}

function seq_state_machine_step() {
	var action = seq_state_machine_states[seq_state_machine_index];
	var props = seq_state_machine_props[seq_state_machine_index];
	
	if (action(props) == StateProgress.Continue) {
		seq_state_machine_index = (seq_state_machine_index + 1) % array_length(seq_state_machine_states);
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

function state_machine_events_apply(_step, _cleanUp) {
	stateMachineStep = _step;
	stateMachineCleanUp = _cleanUp;
}

function state_machine_try_step() {
	if (stateMachineStep != undefined) {
		script_execute(stateMachineStep);
	}
}

function state_machine_try_clean_up() {
	if (stateMachineCleanUp != undefined) {
		script_execute(stateMachineCleanUp);
	}
}

enum StateProgress {
	Continue,
	Transition
}