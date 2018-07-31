# Environment

This package aims to provide a basic environment for experiments on reinforcement learning algorithms in Julia.

## Supported Environments

Currently, only [OpenAIGym](https://github.com/openai/gym) is supported. More environments are coming soon.

### TODO

- [ ] [ViZDoom](https://github.com/mwydmuch/ViZDoom)

    Will be supported using [CxxWrap.jl](https://github.com/JuliaInterop/CxxWrap.jl). Due to the grammar change in the latest CxxWrap.jl, the client of ViZDoom need to be updated.
- [x] [bullet3](https://github.com/bulletphysics/bullet3)

    Since there exists a [PyBullet-gym](https://github.com/benelot/pybullet-gym) repo, no need to add another wrapper. See more discussion [here](https://discourse.julialang.org/t/julia-interface-to-bullet-physics/12617/19)
- [ ] [Carla](https://github.com/carla-simulator/carla)

    [Carla](https://github.com/carla-simulator/carla) is a very interesting project that I have been watched for a long time. The python client communicate with the server through socket. It seems possible to write a client in pure julia. I'll evaluate the workload later.
- [ ] Support distributed environment so that we can take a batch of actions.
- [ ] Multi-agent support.
- [ ] Benchmark

## Install

1. Install [OpenAIGym](https://github.com/openai/gym#installation) first.
1. Add `Environment.jl` as a dependency.

    ```pkg> add https://github.com/findmyway/Environment.jl```

## Examples

Checkout [gymenv.jl](https://github.com/findmyway/Environment.jl/blob/master/test/gymenv.jl) for usage.
