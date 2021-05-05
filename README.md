# RoShamBo
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fevanthegrayt%2Fro_sham_bo%2Fbadge%3Fref%3Dmaster&style=flat)](https://actions-badge.atrox.dev/evanthegrayt/ro_sham_bo/goto?ref=master)
[![Gem Version](https://badge.fury.io/rb/ro_sham_bo.svg)](https://badge.fury.io/rb/ro_sham_bo)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Simple Rock, Paper, Scissors game for the command-line, implemented in ruby.

## Installation
Just install the gem!
```
gem install ro_sham_bo
```
Alternatively, build from source.
```
git clone https://github.com/evanthegrayt/ro_sham_bo.git
cd ro_sham_bo
rake install
```

## Usage
### Command Line
Just call the `ro_sham_bo` executable, which should now be in your `$PATH`.
The default number of rounds is best-of `3`. This can be altered with the
`-r [NUMBER OF ROUNDS]` option. The number passed must be an odd number. To see
a list of all available options, run with `-h`.
```
ro_sham_bo [OPTIONS]
```
After calling the executable, you'll be asked to enter 'rock', 'paper', or
'scissors' (entering the first letters of the options is also accepted for
brevity's sake). The program will also randomly choose one of these options.
Once you hit `[return]`, your choice will be compared to the computer's choice,
and a winner for that round will be chosen based off the classic rules of the
game.

```
$ ro_sham_bo
>> FIRST TO 2 WINS! <<

Current score: {:user=>0, :computer=>0}
What is your choice? (r)ock, (p)aper, or (s)cissors?: p
> user chose paper
> computer chose paper
Round winner: draw

Current score: {:user=>0, :computer=>0}
What is your choice? (r)ock, (p)aper, or (s)cissors?: s
> user chose scissors
> computer chose rock
Round winner: computer

Current score: {:user=>0, :computer=>1}
What is your choice? (r)ock, (p)aper, or (s)cissors?: r
> user chose rock
> computer chose paper
Round winner: computer

Game over! Computer won!
Score was {:user=>0, :computer=>2}
```

Cheating is possible, both for the user and the computer. Pass `-c` (or `-c
user`) for the user to always win. Pass `-c computer` to make the computer win.
It will still look real; cheating only actually happens when the non-cheater
only needs one more point to win. Even then, it can still return a draw for that
round.

### Console
You can play via an IRB/Pry console via the gem's API.

```ruby
require 'ro_sham_bo'
# => true

game = RoShamBo.new
# => #<RoShamBo:0x00007f7ffa99a5a8
#  @cheater=nil,
#  @draws=0,
#  @points_to_win=2,
#  @rounds=3,
#  @score={:user=>0, :computer=>0}>

game.play(:rock)
#=> #<RoShamBo:0x00007f7ffa99a5a8
# @cheater=nil,
# @computer_choice=:rock,
# @draws=1,
# @points_to_win=2,
# @round_winner=:draw,
# @rounds=3,
# @score={:user=>0, :computer=>0},
# @user_choice=:rock>

game.play(%i[rock paper scissors].sample) until game.over?
game
# => #<RoShamBo:0x00007f7ffa99a5a8
#  @cheater=nil,
#  @computer_choice=:paper,
#  @draws=3,
#  @points_to_win=2,
#  @round_winner=:user,
#  @rounds=3,
#  @score={:user=>2, :computer=>0},
#  @user_choice=:scissors,
#  @winner=:user>
```

### Rules
The rules are standard rock, paper, scissors rules.
- Rock beats Scissors
- Scissors beats Paper
- Paper beats Rock
- Two of a kind results in a draw

## Reporting Bugs
This was just a fun project for me to work on, but if you find problems, please
[create an
issue](https://github.com/evanthegrayt/ro_sham_bo/issues/new).

## Self-Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the
repository](https://github.com/evanthegrayt/ro_sham_bo) if you like it!
If you love it, follow me [on github](https://github.com/evanthegrayt)!
