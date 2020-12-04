function seq_state_machine_create(params, loop){
	var length = array_length(params);
	
	var states = array_create(length);
	var props = array_create(length);
	var index = 0;
	
	for (var i = 0; i < length; i++) {
		var param = params[i];
		states[i] = variable_struct_get(param, "state");
		props[i] = variable_struct_get(param, "props");
	}
	
	if (loop != true) {
		array_push(states, ai_action_stop);
		array_push(props, undefined);
	}
	
	return {
		states: states,
		props: props,
		index: index,
		step: seq_state_machine_step
	}
}

function seq_state_machine_step(machine) {
	var action = machine.states[machine.index];
	var props = machine.props[machine.index];
	
	var progress = action(props);
	if (progress == StateProgress.Transition) {
		machine.index = (machine.index + 1) % array_length(machine.states);
	}
	else if (progress == StateProgress.Stop) {
		machine.progress = StateProgress.Stop;
	}
}

/// @description   Create the necessary instance fields for an unmanaged state machine, where the states themselves dictate the next state.
/// @param states  The states to execute
/// @param state*  Optional starting state, else will be 0.
function unmanaged_state_machine_create(states) {
	var machine = {
		states: states,
		index: argument_count > 1
			? argument[1]
			: 0,
		progress: StateProgress.Continue,
		step: unmanaged_state_machine_step
	};
		
	return machine;
}

function unmanaged_state_machine_step(machine) {
	var action = machine.states[machine.index];
	
	machine.index = action();
	if (machine.index == StateProgress.Stop) {
		machine.progress = StateProgress.Stop;
	}
}

function state_machine_try_step(machine) {
	if (machine == undefined) {
		return;
	}
	
	var progress = variable_struct_get(machine, "progress");
	if (progress == StateProgress.Stop) {
		return;
	}
	
	var step = variable_struct_get(machine, "step");
	if (machine != undefined) {
		script_execute(step);
	}
}

enum StateProgress {
	Stop = -1,
	Continue = 0,
	Transition = 1
}