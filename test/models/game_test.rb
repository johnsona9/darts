require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @game = Game.new
  end

  test 'players cannot be same' do
    @game.player_one = 'adam'
    @game.player_two = 'adam'
    assert_not @game.save
  end

  test 'game saves with two names' do
    @game.player_one = 'adam'
    @game.player_two = 'alex'
    assert @game.save
  end
end
