abstract type AbstractEnvironment end

"Move to the next step of an environment"
function step! end

"Reset an environment"
function reset! end

"Render the current environment"
function render end

"Close an environment"
function close! end

"Set the random seed of an environment"
function seed! end

"get the current state of an environment"
function get_state end

function is_end end

function get_reward end