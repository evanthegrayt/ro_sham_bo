# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/ro_sham_bo'

class RoShamBoTest < Test::Unit::TestCase
  def test_rules
    assert_equal(
      {
        rock:     {rock: :draw, paper: :lose, scissors: :win},
        paper:    {rock: :win,  paper: :draw, scissors: :lose},
        scissors: {rock: :lose, paper: :win,  scissors: :draw}
      },
      RoShamBo::RULES
    )
  end

  def test_normal_rules
    game = RoShamBo.new
    assert_instance_of(RoShamBo, game)
    refute(game.cheater)
    assert_equal(3, game.rounds)
    assert_equal(0, game.draws)
    assert_equal({user: 0, computer: 0}, game.score)
    assert_equal(2, game.points_to_win)
    refute(game.user_choice)
    refute(game.computer_choice)
    refute(game.round_winner)
    refute(game.winner)
    assert_instance_of(RoShamBo, game.play(:rock))
    assert(game.user_choice)
    assert_equal(:rock, game.user_choice)
    assert(game.computer_choice)
    assert(%i[rock paper scissors].include?(game.computer_choice))
    assert(game.round_winner)
    refute(game.winner)
    refute(game.over?)
    game.play(%i[rock paper scissors].sample) until game.over?
    assert(game.winner)
    assert(game.over?)
    assert(game.score.value?(2))
    assert_raise(RuntimeError) { game.play(:rock) }
  end

  def test_rounds
    assert_raise(ArgumentError) { RoShamBo.new(rounds: 4) }

    game = RoShamBo.new(rounds: 5)
    assert_equal(5, game.rounds)
    assert_equal(3, game.points_to_win)

    game = RoShamBo.new(rounds: 7)
    assert_equal(7, game.rounds)
    assert_equal(4, game.points_to_win)

    game = RoShamBo.new(rounds: 101)
    assert_equal(101, game.rounds)
    assert_equal(51, game.points_to_win)
  end

  def test_cheater
    assert_raise(ArgumentError) { RoShamBo.new(cheater: :nobody) }

    50.times do
      game = RoShamBo.new(cheater: :user)
      game.play(%i[rock paper scissors].sample) until game.over?
      assert_equal(:user, game.winner)
    end

    50.times do
      game = RoShamBo.new(cheater: :computer)
      game.play(%i[rock paper scissors].sample) until game.over?
      assert_equal(:computer, game.winner)
    end
  end

  def test_draws
    game = RoShamBo.new
    assert_equal(0, game.draws)
    game.send(:determine_round_winner, :rock, :rock)
    assert_equal(1, game.draws)
  end
end
