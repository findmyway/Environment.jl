module Space

import Base:contains, size, ==
export BoxSpace, DiscreteSpace, MultiBinarySpace, MultiDiscreteSpace, gymspace2jlspace, sample

include("abstractspace.jl")
include("boxspace.jl")
include("discretespace.jl")
include("multibinaryspace.jl")
include("multidiscretespace.jl")

# Tuple Support
sample(s::Tuple{Vararg{<:AbstractSpace}}) = map(sample, s)
contains(a::Tuple{Vararg{<:AbstractSpace}}, b::Tuple) = length(a) == length(b) &&
    all(map((x, y) -> contains(x, y), a, b))

# Dict Support
sample(s::Dict{String}) = Dict(map((k, v) -> (k, sample(v)), s))
contains(a::Dict{String}, b::Dict{String}) = length(a) == length(b) &&
    all(p -> haskey(b, p.first) ? 
            contains(p.second, b[p.first]) :
            false,
        a)

include("utils.jl")
end