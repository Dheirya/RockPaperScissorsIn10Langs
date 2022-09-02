import random

compwins = 0
playerwins = 0
loses_to = {
    "rock": "scissors",
    "paper": "rock",
    "scissors": "paper",
}


def play(message):
    global compwins, playerwins
    if message:
        print(message)
        if message.startswith('...\nYou'):
            print(f"Score: {playerwins} player wins to {compwins} computer wins\n...")
    computer = random.choice(list(loses_to.keys()))
    player = input("Rock, Paper, or Scissors? ").lower()
    if player not in list(loses_to.keys()):
        play("...\nNot a valid move\n...")
    else:
        if player == computer:
            play("...\nIt's a tie!\n...")
        else:
            if player == loses_to[computer]:
                compwins += 1
                play(f"...\nYou lost... {player.title()} loses to {computer.title()}")
            else:
                playerwins += 1
                play(f"...\nYou won! {player.title()} beats {computer.title()}")


play(None)
