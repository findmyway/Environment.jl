# Environment

This package aims to provide a basic environment for experiments on reinforcement learning algorithms in Julia.

## Supported Environments

Currently, only [OpenAIGym](https://github.com/openai/gym) is supported. More environments are coming soon.

### TODO

- [ ] [ViZDoom](https://github.com/mwydmuch/ViZDoom)
- [ ] [bullet3](https://github.com/bulletphysics/bullet3)
- [ ] [Malmo](https://github.com/Microsoft/malmo)
- [ ] [MAgent](https://github.com/geek-ai/MAgent)

## Install

1. Install [OpenAIGym](https://github.com/openai/gym#installation) first.
1. Add `Environment.jl` as a dependency.

    ```pkg> add https://github.com/findmyway/Environment.jl```

## Examples

Checkout [gymenv.jl](https://github.com/findmyway/Environment.jl/blob/master/test/gymenv.jl) for usage.
