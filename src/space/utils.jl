using PyCall

function gymspace2jlspace(s::PyObject)
    classname = s[:__class__][:__name__]
    if classname == "Box"
        BoxSpace(s[:low], s[:high])
    elseif classname == "Discrete"
        DiscreteSpace(s[:n])
    elseif classname == "MultiBinary"
        MultiBinarySpace(s[:n])
    elseif classname == "MultiDiscrete"
        MultiDiscreteSpace(s[:nvec])
    elseif classname == "Tuple"
        map(gymspace2jlspace, s[:spaces])
    elseif classname == "Dict"
        Dict(map((k, v) -> (k, gymspace2jlspace(v)), s[:spaces]))
    end
end