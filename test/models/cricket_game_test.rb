require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @game = CricketGame.new
  end

  test 'players cannot be same' do
    @game.player_one = 1
    @game.player_two = 1
    assert_not @game.save
  end

  test 'game saves with two names' do
    @game.player_one = 2
    @game.player_two = 1
    assert @game.save
  end
end
