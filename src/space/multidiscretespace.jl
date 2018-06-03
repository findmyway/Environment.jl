struct MultiDiscreteSpace{N} <:AbstractSpace
    counts::Array{Int, N}
end

size(s::MultiDiscreteSpace) = size(s.counts)

sample(s::MultiDiscreteSpace) = map(x -> rand(1:x), s.counts)
contains(s::MultiDiscreteSpace, x::Int) = all(e -> 1 ≤ x ≤ e, s.counts)
contains(s::MultiDiscreteSpace, xs::Array{Int}) = size(s) == size(xs) &&
    all(map((e, x) -> 1 ≤ x ≤ e , s.counts, xs))
==(x::MultiDiscreteSpace, y::MultiDiscreteSpace) = x.counts == y.counts