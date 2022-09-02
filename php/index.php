<?php
  $player = "None";
  $playerwins_name = "playerwins";
  $playerwins = 0;
  $compwins_name = "compwins";
  $compwins = 0;
  $message = "";
  if(!isset($_COOKIE[$playerwins_name])) {
    setcookie($playerwins_name, $playerwins, time() + (86400 * 30), "/");
  } else {
    $playerwins = $_COOKIE[$playerwins_name];
  }
  if(!isset($_COOKIE[$compwins_name])) {
    setcookie($compwins_name, $compwins, time() + (86400 * 30), "/");
  } else {
    $compwins = $_COOKIE[$compwins_name];
  }
  if(isset($_POST['rock'])){
    $player = "Rock";
  }
  if(isset($_POST['paper'])){
    $player = "Paper";
  }
  if(isset($_POST['scissors'])){
    $player = "Scissors";
  }
  $loses_to = [
      'rock' => 'scissors',
      'paper' => 'rock',
      'scissors' => 'paper'
  ];
  if (!empty($_POST)) {
    $computer = array_rand($loses_to);
    if (strtolower($player) == $computer) {
      $message = "It's a tie!";
    } else {
      if (strtolower($player) == $loses_to[$computer]) {
        $compwins += 1;
        setcookie($compwins_name, $compwins, time() + (86400 * 30), "/");
        $message = "You lost... " . $player . " loses to " . ucfirst($computer);
      } else {
        $playerwins += 1;
        setcookie($playerwins_name, $playerwins, time() + (86400 * 30), "/");
        $message = "You won! " . $player . " beats " . ucfirst($computer);
      }
    }
  }
?>
<html>
<body>
<center>
  <h1>Rock, Paper, Scissors, Shoot!</h1>
  <h3>Score: <?php echo $playerwins;?> player wins to <?php echo $compwins;?> computer wins</h2>
  <h2><i>You Chose <?php echo $player;?></i></h2>
  <form action="index.php" method="post">
    <input type="submit" name="rock" value="Rock"/>
    <input type="submit" name="paper" value="Paper"/>
    <input type="submit" name="scissors" value="Scissors"/>
  </form>
  <h2><b><?php echo $message;?></b></p>
</center>
</body>
</html>