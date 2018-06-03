struct DiscreteSpace <: AbstractSpace
    n::Int
end

sample(d::DiscreteSpace) = rand(1:d.n)
contains(d::DiscreteSpace, x::Int) = 1 ≤ x ≤ d.n
==(x::DiscreteSpace, y::DiscreteSpace) = x.n == y.n