@testset "GymEnv" begin

function test_random_rollout(name)
    env = GymEnv(name)
    agent = env -> sample(env.action_space)
    ob = reset!(env)
    for _ in 1:10
        ac = agent(env)
        @test occursin(ac, env.action_space)
        ob, _reward, done, _info = step!(env, ac)
        @test occursin(ob, env.observation_space)
        if done
            break
        end
    end
end

test_random_rollout("CartPole-v0")
test_random_rollout("FrozenLake-v0")
end