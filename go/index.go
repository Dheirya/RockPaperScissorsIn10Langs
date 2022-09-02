package main
import (
    "fmt"
    "strings"
    "strconv"
    "math/rand"
    "time"
)

var compwins int
var playerwins int
var loses_to map[string]string

func computermove() string {
    var random int = 1 + rand.Intn(3)
    if random == 1 {
        return "rock"
    } else if random == 2 {
        return "paper"
    } else {
        return "scissors"
    }
}

func play(message string) {
    if len(message) > 0 {
        fmt.Println(message)
        if strings.HasPrefix(message, "...\nYou") {
            fmt.Println("Score: " + strconv.Itoa(playerwins) + " player wins to " + strconv.Itoa(compwins) + " computer wins\n...")
        }
    }
    var computer string = computermove()
    fmt.Printf("Rock, Paper, or Scissors? ")
    var input string
    fmt.Scanln(&input)
    var player = strings.ToLower(input)
    if val, ok := loses_to[player]; ok {
        _ = val
        if player == computer {
            play("...\nIt's a tie!\n...")
        } else {
            if player == loses_to[computer] {
                compwins += 1
                play("...\nYou lost... " + strings.Title(player) + " loses to " + strings.Title(computer))
            } else {
                playerwins += 1
                play("...\nYou won! " + strings.Title(player) + " beats " + strings.Title(computer))
            }
        }
    } else {
        play("...\nNot a valid move\n...")
    }
}

func main() {
    rand.Seed(time.Now().UnixNano())
    compwins = 0
    playerwins = 0
    loses_to = map[string]string {
        "rock": "scissors",
        "paper": "rock",
        "scissors": "paper",
    }
    play("")
}
