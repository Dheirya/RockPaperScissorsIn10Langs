let compwins = playerwins = 0;

const input = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

const loses_to = {
  rock: "scissors",
  paper: "rock",
  scissors: "paper",
};

const moves = Object.keys(loses_to);

const randomkey = (obj) => obj[moves[(moves.length * Math.random()) << 0]];

const capitalize = (string) => string[0].toUpperCase() + string.slice(1);

const play = (message, showScore) => {
  if (message) {
    console.log(message);
    if (showScore) {
      console.log(
        `Score: ${playerwins} player wins to ${compwins} computer wins\n`
      );
    }
  }
  computer = randomkey(loses_to);
  input.question("Rock, Paper, or Scissors? ", function (inputted) {
    player = inputted.toLowerCase();
    if (!moves.includes(player)) {
      play("\nNot a valid move\n");
    } else {
      if (player == computer) {
        play("\nIt's a tie!\n");
      } else {
        playerupper = capitalize(player);
        computerupper = capitalize(computer);
        if (player == loses_to[computer]) {
          compwins += 1;
          play(`\nYou lost\n${playerupper} loses to ${computerupper}\n`, true);
        } else {
          playerwins += 1;
          play(`\nYou won! ${playerupper} beats ${computerupper}\n`, true);
        }
      }
    }
  });
};

play();
