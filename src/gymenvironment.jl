using PyCall

@pyimport gym

struct GymEnv <: AbstractEnvironment 
    name:: String
    action_space
    observation_space
    reward_range
    pygymenv
end

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
           pygymenv[:reward_range],
           pygymenv)
end

reset!(env::GymEnv) = env.pygymenv[:reset]()
render(env::GymEnv, mode="human") = env.pygymenv[:render](mode)
step!(env::GymEnv, action) = env.pygymenv[:step](action)
close!(env::GymEnv) = env.pygymenv[:close]()
seed!(env::GymEnv, seed=nothing) = env.pygymenv[:seed](seed)