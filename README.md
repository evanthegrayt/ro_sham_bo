# RoShamBo
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

Cheating is possible, both for the user and the computer. Pass `-c` (or `-c
user`) for the user to always win. Pass `-c computer` to make the computer win.
It will still look real; cheating only actually happens when the non-cheater has
one less point than is needed to win. Even then, it can still return a draw for
that round.

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
