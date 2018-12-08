class RockPaperScissors

  RULES = {
    rock:     {rock: :draw, paper: :lose, scissors: :win},
    paper:    {rock: :win,  paper: :draw, scissors: :lose},
    scissors: {rock: :lose, paper: :win,  scissors: :draw},
  }.freeze

  attr_reader :score, :points_to_win

  def initialize(options = {rounds: 3})
    @options = options
    @score = {user: 0, computer: 0}
    @points_to_win = (options[:rounds].to_f / 2).ceil
  end

  def user_choice(user_input)
    case user_input
    when 'r', 'rock'              then :rock
    when 'p', 'paper'             then :paper
    when 's', 'scissors'          then :scissors
    when 'x', 'exit', 'q', 'quit' then :exit
    end
  end

  def computer_choice
    RULES.keys.sample
  end

  def round_winner(u_choice, c_choice)
    winner =
      case RULES[u_choice][c_choice]
      when :win  then :user
      when :lose then :computer
      else :draw
      end
    score[winner] += 1 unless winner == :draw
    winner
  end

  def game_winner
    score.key(points_to_win).capitalize if score.value?(points_to_win)
  end

  def game_winner?
    !game_winner.nil?
  end

end

