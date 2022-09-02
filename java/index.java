import java.util.Scanner;
import java.util.Random;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class Index {
    public static void main(String[] args) {
        HashMap <String, String> loses_to = new HashMap <String, String> ();
        loses_to.put("rock", "scissors");
        loses_to.put("paper", "rock");
        loses_to.put("scissors", "paper");
        List <String> moves = new ArrayList <String> (loses_to.values());
        final AtomicInteger compwins = new AtomicInteger(0);
        final AtomicInteger playerwins = new AtomicInteger(0);
        while (true) {
            int randomMove = new Random().nextInt(3);
            String computer = moves.get(randomMove);
            Scanner input = new Scanner(System.in);
            System.out.print("Rock, Paper, or Scissors? ");
            String player = input.nextLine().toLowerCase();
            if (!moves.contains(player)) {
                System.out.println("...");
                System.out.println("Not a valid move");
                System.out.println("...");
            } else {
                if (player.equals(computer)) {
                    System.out.println("...");
                    System.out.println("It's a tie!");
                    System.out.println("...");
                } else {
                    String playerupper = player.substring(0, 1).toUpperCase() + player.substring(1);
                    String computerupper = computer.substring(0, 1).toUpperCase() + computer.substring(1);
                    if (player.equals(loses_to.get(computer))) {
                        compwins.incrementAndGet();
                        System.out.println("...");
                        System.out.println("You lost... " + playerupper + " loses to " + computerupper);
                        System.out.println("Score: " + playerwins + " player wins to " + compwins + " computer wins");
                        System.out.println("...");
                    } else {
                        playerwins.incrementAndGet();
                        System.out.println("...");
                        System.out.println("You won! " + playerupper + " beats " + computerupper);
                        System.out.println("Score: " + playerwins + " player wins to " + compwins + " computer wins");
                        System.out.println("...");
                    }
                }
            }
        }
    }
}
