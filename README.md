# rock-paper-scissors
Simple Rock, Paper, Scissors game for the command-line.

## Installation
Clone the repository where you want it:
```sh
git clone https://github.com/evanthegrayt/rock-paper-scissors.git
cd rock-paper-scissors
```
From inside the base directory of the repository, run one of the following:
```sh
# If you have `rake` installed (`gem install rake`):
rake
# ...or install it manually:
ln -s $PWD/bin/rps /usr/local/bin
```

## Usage
Just call the `rps` executable, which should now be in your `$PATH`.
The default number of rounds is best-of `3`. This can be altered with the
`-r [NUMBER OF ROUNDS]` option. The number passed must be an odd number. To see
a list of all available options, run with `-h`.
```
rps [OPTIONS]
```
After calling the executable, you'll be asked to enter 'rock', 'paper', or
'scissors' (entering the first letters of the options is also accepted for
brevity's sake). The program will also randomly choose one of these options.
Once you hit `[return]`, your choice will be compared to the computer's choice,
and a winner for that round will be chosen based off the classic rules of the
game.

### Rules
Rock beats Scissors    
Scissors beats Paper    
Paper beats Rock

## Reporting Bugs
This was just a fun project for me to work on, but if you find problems, please
[create an
issue](https://github.com/evanthegrayt/rock-paper-scissors/issues/new).

## Self-Promotion
I do these projects for fun, and I enjoy knowing that they're helpful to people.
Consider starring [the
repository](https://github.com/evanthegrayt/rock-paper-scissors) if you like it!
If you love it, follow me [on github](https://github.com/evanthegrayt)!
