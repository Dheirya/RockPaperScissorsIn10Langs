$compwins = 0
$playerwins = 0
$loses_to = {
    "rock" => "scissors",
    "paper" => "rock",
    "scissors" => "paper",
}


def play(message = nil)
    if message
        puts message
        if message.start_with?("...\nYou")
            puts "Score: #{$playerwins} player wins to #{$compwins} computer wins\n..."
        end
    end
    computer = $loses_to.keys.sample
    print "Rock, Paper, or Scissors? "
    player = gets.chomp.downcase
    if not $loses_to.key?(player)
        play("...\nNot a valid move\n...")
        return
    else
        if player == computer
            play("...\nIt's a tie!\n...")
            return
        end
        if player == $loses_to[computer]
            $compwins += 1
            play("...\nYou lost... #{player.capitalize} loses to #{computer.capitalize}")
            return
        else
            $playerwins += 1
            play("...\nYou won! #{player.capitalize} beats #{computer.capitalize}")
            return
        end
    end
end


play()
