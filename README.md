# Environment

This package aims to provide a basic environment for experiments on reinforcement learning algorithms in Julia.

## Supported Environments

Currently, only [OpenAIGym](https://github.com/openai/gym) is supported. More environments are coming soon.

### TODO

- [ ] [ViZDoom](https://github.com/mwydmuch/ViZDoom)

    Will be supported using [CxxWrap.jl](https://github.com/JuliaInterop/CxxWrap.jl)
- [x] [bullet3](https://github.com/bulletphysics/bullet3)

    Since there exists a [PyBullet-gym](https://github.com/benelot/pybullet-gym) repo, no need to add another wrapper.
- [ ] [Carla](https://github.com/carla-simulator/carla)

    [Carla](https://github.com/carla-simulator/carla) is a very interesting project that I have been watched for a long time. The python client communicate with the server through socket. It seems possible to write a client in pure julia. I'll evaluate the workload later.

## Install

1. Install [OpenAIGym](https://github.com/openai/gym#installation) first.
1. Add `Environment.jl` as a dependency.

    ```pkg> add https://github.com/findmyway/Environment.jl```

## Examples

Checkout [gymenv.jl](https://github.com/findmyway/Environment.jl/blob/master/test/gymenv.jl) for usage.
