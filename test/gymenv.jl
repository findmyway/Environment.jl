@testset "GymEnv" begin

function test_random_rollout(name)
    env = GymEnv(name)
    agent = env -> sample(action_space(env))
    ob = reset!(env)
    for _ in 1:10
        ac = agent(env)
        @test occursin(ac, action_space(env))
        step!(env, ac)
        @test occursin(get_state(env), observation_space(env))
        if is_end(env)
            break
        end
    end
end

test_random_rollout("CartPole-v0")
test_random_rollout("FrozenLake-v0")
end