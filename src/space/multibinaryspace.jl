struct MultiBinarySpace <: AbstractSpace
    size::Tuple{Vararg{Int}}
end

MultiBinarySpace(sz::Vararg{Int}) = MultiBinarySpace(sz)

size(s::MultiBinarySpace) = s.size

sample(s::MultiBinarySpace) = rand(Bool, s.size...)
contains(s::MultiBinarySpace, x::Array{Bool}) = size(s) == size(x)
==(x::MultiBinarySpace, y::MultiBinarySpace) = x.size == y.size