using PyCall

@pyimport gym

struct GymEnv <: AbstractEnvironment 
    name::String
    action_space
    observation_space
    state::PyObject
    pygymenv
end

"""
    GymEnv(name)

Initialize a [OpenAIGym](https://github.com/openai/gym) environment
and wrap it in a `GymEnv` struct.
"""
function GymEnv(name::String)
    pygymenv = nothing
    try
        pygymenv = gym.make(name)
    catch e
        error("Error when initializing [$name]\n$e")
    end
    GymEnv(name,
           gymspace2jlspace(pygymenv[:action_space]),
           gymspace2jlspace(pygymenv[:observation_space]),
           PyNULL(),
           pygymenv)
end

"""
    step!(env::GymEnv, action)

`action` should be a valid sample in `env.action_space`.
"""
function step!(env::GymEnv, action) 
    pycall!(env.state, env.pygymenv[:step], PyVector, action)
end

close!(env::GymEnv) = env.pygymenv[:close]()
seed!(env::GymEnv, seed=nothing) = env.pygymenv[:seed](seed)
reset!(env::GymEnv) = env.pygymenv[:reset]()
render(env::GymEnv, mode="human") = env.pygymenv[:render](mode)
action_space(env::GymEnv) = env.action_space
observation_space(env::GymEnv) = env.observation_space
get_state(env::GymEnv) = env.state[1]
get_reward(env::GymEnv) = env.state[2]
is_end(env::GymEnv) = env.state[3]