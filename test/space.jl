using Environment.Space
using PyCall


@testset "Space" begin

@testset "BoxSpace" begin
    @test contains(BoxSpace(0, 1), 0.5) == true
    @test contains(BoxSpace(0, 1), 0.0) == true
    @test contains(BoxSpace(0, 1), 1.0) == true
    @test contains(BoxSpace(0, 1), -1.0) == false
    @test contains(BoxSpace(0, 1), -Inf) == false
    @test contains(BoxSpace(0, 1), [0.5]) == true

    @test contains(BoxSpace([-1, -2], [1, 2]), [0, 0]) == true
    @test contains(BoxSpace([-1, -2], [1, 2]), [0, 3]) == false
    @test contains(BoxSpace([-1, -2], [1, 2]), [0, 0]) == true
end

@testset "DiscreteSpace" begin
    @test contains(DiscreteSpace(10), 1) == true
    @test contains(DiscreteSpace(10), 5) == true
    @test contains(DiscreteSpace(10), 10) == true
    @test contains(DiscreteSpace(10), 11) == false
    @test contains(DiscreteSpace(10), 0) == false
end

@testset "MultiBinarySpace" begin
    @test contains(MultiBinarySpace(2,2), [true false; true false]) == true
    @test contains(MultiBinarySpace(2,2), [true false]) == false
end

@testset "MultiDiscreteSpace" begin
    @test contains(MultiDiscreteSpace([2,3,2]), 2) == true
    @test contains(MultiDiscreteSpace([2,3,2]), [1,1,1]) == true
    @test contains(MultiDiscreteSpace([2,3,2]), [0,0,0]) == false
    @test contains(MultiDiscreteSpace([2,3,2]), [3,3,3]) == false
end

@testset "Space Tuple" begin
    @test contains(
        (BoxSpace(0,1), DiscreteSpace(5), MultiBinarySpace(2,2), MultiDiscreteSpace([2,2])),
        ([0.5], 5, [true true; true true], [1, 1])) == true
    @test contains(
        (BoxSpace(0,1), DiscreteSpace(5), MultiBinarySpace(2,2), MultiDiscreteSpace([2,2])),
        ([0.5], 0, [true true; true true], [1, 1])) == false
    @test contains(
        (BoxSpace(0,1), DiscreteSpace(5), MultiBinarySpace(2,2), MultiDiscreteSpace([2,2])),
        ()) == false
end

@testset "Space Dict" begin
    @test contains(
        Dict(
            "sensors" =>  Dict(
                "position"=> BoxSpace(-100, 100, (3,)),
                "velocity"=> BoxSpace(-1, 1, (3,)),
                "front_cam"=> (BoxSpace(0, 1, (10, 10, 3)),
                               BoxSpace(0, 1, (10, 10, 3))),
                "rear_cam" => BoxSpace(0, 1, (10, 10, 3))),
            "ext_controller" => MultiDiscreteSpace([5, 2, 2]),
            "inner_state" => Dict(
                "charge" => DiscreteSpace(100),
                "system_checks" => MultiBinarySpace(10),
                "job_status" => Dict(
                    "task" => DiscreteSpace(5),
                    "progress" => BoxSpace(0, 100)))),
        Dict(
            "sensors" => Dict(
                "position" => [-10, 0, 10],
                "velocity" => [0.1, 0.2, 0.3],
                "front_cam" => (rand(10, 10, 3), rand(10, 10, 3)),
                "rear_cam" => rand(10,10,3)),
            "ext_controller" => [2, 1, 1],
            "inner_state" => Dict(
                "charge" => 35,
                "system_checks" => rand(Bool, 10),
                "job_status" => Dict(
                    "task" => 3,
                    "progress" => 23)))) == true
end

@testset "gym space transformation" begin
    @pyimport gym
    env = gym.make("CartPole-v0")
    @test gymspace2jlspace(env[:action_space]) == DiscreteSpace(2)
    @test gymspace2jlspace(env[:observation_space]) == BoxSpace(Array{Float32}([-4.8, -3.4028235e38, -0.41887903, -3.4028235e38]),
                                                                 Array{Float32}([4.8, 3.4028235e38, 0.41887903, 3.4028235e38]))
    env = gym.make("Blackjack-v0")
    @test gymspace2jlspace(env[:observation_space]) == (DiscreteSpace(32), DiscreteSpace(11), DiscreteSpace(2))

end
end