module CricketGamesHelper
  def is_editable?
    return (!current_user_one.nil? && current_user_one.id == @game.player_one) && (!current_user_two.nil? && current_user_two.id == @game.player_two) && !game_over? ? 1 : 0
  end

  def game_over?
    if all_closed?('one') && @game[:player_one_score] > @game[:player_two_score]
      true
    elsif all_closed?('two') && @game[:player_two_score] > @game[:player_one_score]
      true
    else
      false
    end
  end

  private

    def all_closed?(player_num)
      player = "player_#{player_num}_"
      returner = true
      returner = @game[player + '15'] >= 3 && returner
      returner = @game[player + '16'] >= 3 && returner
      returner = @game[player + '17'] >= 3 && returner
      returner = @game[player + '18'] >= 3 && returner
      returner = @game[player + '19'] >= 3 && returner
      returner = @game[player + '20'] >= 3 && returner
      returner = @game[player + 'be'] >= 3 && returner
    end
end
