#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>

int compwins = 0;
int playerwins = 0;
char * moves[3] = {"rock", "paper", "scissors"};
#define ARR_SIZE(moves)(sizeof((moves)) / sizeof((moves[0])))

const char * loses_to(char * move) {
    if (strcmp(move, "rock") == 0) {
        return "scissors";
    } else if (strcmp(move, "paper") == 0) {
        return "rock";
    } else {
        return "paper";
    }
}

const char * lowercase(char * str) {
    for (int i = 0; str[i]; i++) {
        str[i] = tolower(str[i]);
    }
    return str;
}

int notin(char * target) {
    int i;
    for (i = 0; i < 3; i++) {
        if (strncmp(moves[i], target, strlen(target)) == 0) {
            return 0;
        }
    }
    return 1;
}

void play(char * message) {
    if (strlen(message) > 0) {
        printf("%s", message);
        if (strlen(message) > 27) {
            printf("\nScore: %d player wins to %d computer wins\n...\n", playerwins, compwins);
        }
    }
    srand(time(0));
    char computer[strlen(moves[rand() % ARR_SIZE(moves)]) + 1];
    char input[8];
    strcpy(computer, moves[rand() % ARR_SIZE(moves)]);
    printf("Rock, Paper, or Scissors? ");
    scanf("%s", input);
    char player[strlen(lowercase(input)) + 1];
    strcpy(player, lowercase(input));
    if (notin(player)) {
        play("...\nNot a valid move\n...\n");
    } else {
        if (strcmp(player, computer) == 0) {
            play("...\nIt's a tie!\n...\n");
        } else {
            char loses_to_move[strlen(loses_to(computer)) + 1];
            strcpy(loses_to_move, loses_to(computer));
            if (strcmp(player, loses_to_move) == 0) {
                player[0] = toupper(player[0]);
                computer[0] = toupper(computer[0]);
                compwins++;
                char losemessage[64];
                snprintf(losemessage, sizeof(losemessage), "...\nYou lost... %s loses to %s", player, computer);
                play(losemessage);
            } else {
                player[0] = toupper(player[0]);
                computer[0] = toupper(computer[0]);
                playerwins++;
                char winmessage[64];
                snprintf(winmessage, sizeof(winmessage), "...\nYou won! %s beats %s", player, computer);
                play(winmessage);
            }
        }
    }
}

int main() {
    play("");
    return 0;
}
