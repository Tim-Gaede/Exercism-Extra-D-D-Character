# For a game of Dungeons & Dragons, each player starts by
# generating a character they can play with.

# This character has, among other things, six abilities:
#    strength, dexterity, constitution, intelligence, wisdom and charisma.

# These six abilities have scores that are determined randomly.

# You do this by rolling four 6-sided dice and
# record the sum of the largest three dice.

# You do this six times, once for each ability.

# Your character's initial hitpoints are
# 10 + your character's constitution modifier.

# You find your character's constitution modifier by
# subtracting 10 from your character's constitution, divide by 2 and round down.



function best_3_of_4()
    rolls = Int[]

    for i = 1 : 4
        push!(rolls, rand(1:6))
    end

    sort!(rolls)

    rolls[1] + rolls[2] + rolls[3] # returned
end


function ability(c)
    ability_ID = rand(1 : 6)

    if     ability_ID == 1;    return c.strength;
    elseif ability_ID == 2;    return c.dexterity;
    elseif ability_ID == 3;    return c.constitution;
    elseif ability_ID == 4;    return c.intelligence;
    elseif ability_ID == 5;    return c.wisdom;
    elseif ability_ID == 6;    return c.charisma;
    end

end


modifier(num::Number) = convert(Int, floor((num-10) / 2))


# Default field values may become available in Julia 1.4
# https://github.com/JuliaLang/julia/issues/10146
struct Character
    strength
    dexterity
    constitution
    intelligence
    wisdom
    charisma

    hitpoints
end



function initialize(c)
    c.strength     = best_3_of_4()
    c.dexterity    = best_3_of_4()
    c.constitution = best_3_of_4()
    c.intelligence = best_3_of_4()
    c.wisdom       = best_3_of_4()
    c.charisma     = best_3_of_4()

    c.hitpoints = 10 + modifier(c.constitution)
end
