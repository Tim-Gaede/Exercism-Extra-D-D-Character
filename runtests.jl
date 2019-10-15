using Test

include("dnd_character.jl")


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.1.0


@testset "modifier for score 3 is -4" begin
    @test modifier(3) == -4
end

@testset "modifier for score 4 is -3" begin
    @test modifier(4) == -3
end

@testset "modifier for score 5 is -3" begin
    @test modifier(5) == -3
end

@testset "modifier for score 6 is -2" begin
    @test modifier(6) == -2
end

@testset "modifier for score 7 is -2" begin
    @test modifier(7) == -2
end

@testset "modifier for score 8 is -1" begin
    @test modifier(8) == -1
end

@testset "modifier for score 9 is - 1" begin
    @test modifier(9) == -1
end

@testset "modifier for score 10 is 0" begin
    @test modifier(10) == 0
end

@testset "modifier for score 11 is 0" begin
    @test modifier(11) == 0
end

@testset "modifier for score 12 is 1" begin
    @test modifier(12) == 1
end

@testset "modifier for score 13 is 1" begin
    @test modifier(13) == 1
end

@testset "modifier for score 14 is 2" begin
    @test modifier(14) == 2
end

@testset "modifier for score 15 is 2" begin
    @test modifier(15) == 2
end

@testset "modifier for score 16 is 3" begin
    @test modifier(16) == 3
end

@testset "modifier for score 17 is 3" begin
    @test modifier(17) == 3
end

@testset "modifier for score 18 is 4" begin
    @test modifier(18) == 4
end

@testset "random ability is within range" begin
    Char = Character(0,0,0,0,0,0,0)
    initialize(Char)
    @test ability(Char) in range(3, stop=19)
end

@testset "random character is valid" begin
    Char = Character(0,0,0,0,0,0,0)
    initialize(Char)
    @test Char.strength in range(3, stop=19)
    @test Char.dexterity in range(3, stop=19)
    @test Char.constitution in range(3, stop=19)
    @test Char.intelligence in range(3, stop=19)
    @test Char.wisdom in range(3, stop=19)
    @test Char.charisma in range(3, stop=19)
    @test Char.hitpoints == 10 + modifier(Char.constitution)
end


@testset "each ability is only calculated once" begin
    Char = Character(0,0,0,0,0,0,0)
    initialize(Char)
    @test Char.strength == Char.strength
end
