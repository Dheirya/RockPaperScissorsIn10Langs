local compwins = 0
local playerwins = 0
local loses_to = {
    ['rock'] = 'scissors',
    ['paper'] = 'rock',
    ['scissors'] = 'paper',
}
local moves = {"rock", "paper", "scissors"}

function string.starts(String, Start)
   return string.sub(String, 1,string.len(Start)) == Start
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function uppercase(str)
    return (str:gsub("^%l", string.upper))
end

function play(message)
    if message then
        print(message)
        if string.starts(message, "...\nYou") then
            print("Score: " .. playerwins .. " player wins to " .. compwins .. " computer wins\n...")
        end
    end
    local computer = moves[math.random(1, 3)]
    io.write('Rock, Paper, or Scissors? ')
    local player = string.lower(io.read())
    if not has_value(moves, player) then
        play("...\nNot a valid move\n...")
    else
        if player == computer then
            play("...\nIt's a tie!\n...")
        else
            if player == loses_to[computer] then
                compwins = compwins + 1
                play("...\nYou lost... " .. uppercase(player) .. " loses to " .. uppercase(computer))
            else
                playerwins = playerwins + 1
                play("...\nYou won! " .. uppercase(player) .. " beats " .. uppercase(computer))
            end
        end
    end
end

play(nil)
