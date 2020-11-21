/// @function coalesce(val1, val2, ...)
/// @description Given a list of variables, return the first variable that is not undefined.
function coalesce(){
	var argCount = argument_count;
	for (var i = 0; i < argCount; i++) {
		if (argument[i] != undefined) {
			return argument[i];
		}
	}
}