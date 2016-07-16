class AddPlayerOneScoreAndPlayerTwoScoreToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :player_one_score, :integer
    add_column :games, :player_two_score, :integer
  end
end
