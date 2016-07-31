class AddDefaultValuesToGames < ActiveRecord::Migration[5.0]
  def change
    change_column_default :games, :player_one_score, 0
    change_column_default :games, :player_one_15, 0
    change_column_default :games, :player_one_16, 0
    change_column_default :games, :player_one_17, 0
    change_column_default :games, :player_one_18, 0
    change_column_default :games, :player_one_19, 0
    change_column_default :games, :player_one_20, 0
    change_column_default :games, :player_one_be, 0

    change_column_default :games, :player_two_score, 0
    change_column_default :games, :player_two_15, 0
    change_column_default :games, :player_two_16, 0
    change_column_default :games, :player_two_17, 0
    change_column_default :games, :player_two_18, 0
    change_column_default :games, :player_two_19, 0
    change_column_default :games, :player_two_20, 0
    change_column_default :games, :player_two_be, 0
  end
end
