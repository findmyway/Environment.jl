module Environment

include("space/Space.jl")
using .Space
export BoxSpace, DiscreteSpace, MultiBinarySpace, MultiDiscreteSpace, gymspace2jlspace, sample

include("abstractenvironment.jl")
include("gymenvironment.jl")
export GymEnv, step!, reset!, render, close!, seed!, get_state, get_reward, is_end, action_space, observation_space

end # module
