#!/usr/bin/perl

use warnings;
use strict;

my $compwins = 0;
my $playerwins = 0;
my %loses_to = (rock => 'scissors', paper => 'rock', scissors => 'paper');

sub play {
    if (defined($_[0])) {
        printf "...\n";
        printf $_[0];
        if (length($_[0]) > 24) {
            printf "Score: $playerwins player wins to $compwins computer wins\n";
            printf "...\n";
        }
        else {
            printf "...\n";
        }
    }
    my $computer = $loses_to{(keys %loses_to)[rand keys %loses_to]};
    print "Rock, Paper, or Scissors? ";
    my $player = <>;
    chomp($player);
    $player = lc($player);
    if (exists $loses_to{$player}) {
        if ($player eq $computer) {
            play("It's a tie!\n");
        } else {
            my $playerupper = ucfirst($player);
            my $computerupper = ucfirst($computer);
            if ($player eq $loses_to{$computer}) {
                $compwins++;
                play("You lost... $playerupper loses to $computerupper\n")
            } else {
                $playerwins++;
                play("You won! $playerupper beats $computerupper\n")
            }
        }
    } else {
        play("Not a valid move\n");
    }
}
play();
