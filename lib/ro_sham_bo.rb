require_relative "ro_sham_bo/version"

class RoShamBo
  RULES = {
    rock: {rock: :draw, paper: :lose, scissors: :win}.freeze,
    paper: {rock: :win, paper: :draw, scissors: :lose}.freeze,
    scissors: {rock: :lose, paper: :win, scissors: :draw}.freeze
  }.freeze

  attr_reader :cheater
  attr_reader :rounds
  attr_reader :score
  attr_reader :draws
  attr_reader :points_to_win
  attr_reader :user_choice
  attr_reader :computer_choice
  attr_reader :round_winner
  attr_reader :winner

  def initialize(cheater: nil, rounds: 3)
    if rounds.even?
      raise ArgumentError, "rounds must be odd"
    elsif ![nil, :user, :computer].include?(cheater)
      raise ArgumentError, "cheater must be :computer or :user"
    end

    @cheater = cheater
    @rounds = rounds
    @score = {user: 0, computer: 0}
    @draws = 0
    @points_to_win = (rounds.to_f / 2).ceil
  end

  def play(input)
    raise "Game Over!" if over?

    @user_choice = sanitized_choice(input)
    @computer_choice = computer_turn(user_choice)
    @round_winner = determine_round_winner(@user_choice, @computer_choice)
    @winner = score.key(points_to_win) if score.value?(points_to_win)

    self
  end

  def over?
    !winner.nil?
  end

  private

  def determine_round_winner(u_choice, c_choice)
    case RULES.dig(u_choice, c_choice)
    when :win then :user
    when :lose then :computer
    else :draw
    end.tap { |winner| (winner == :draw) ? @draws += 1 : score[winner] += 1 }
  end

  def sanitized_choice(input)
    case input.intern
    when :r, :rock then :rock
    when :p, :paper then :paper
    when :s, :scissors then :scissors
    else raise ArgumentError, "Invalid choice [(r)ock, (s)cissors, (p)aper]"
    end
  end

  def computer_turn(input)
    if cheater == :user && about_to_win?(:computer)
      cheat(input, :win)
    elsif cheater == :computer && about_to_win?(:user)
      cheat(input, :lose)
    else
      RULES.keys.sample
    end
  end

  def cheat(input, win_or_lose)
    (rand >= 0.33) ? RULES[input].key(win_or_lose) : RULES[input].key(:draw)
  end

  def about_to_win?(user)
    score[user] == points_to_win - 1
  end
end
