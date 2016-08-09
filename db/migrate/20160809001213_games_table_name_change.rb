class GamesTableNameChange < ActiveRecord::Migration[5.0]
  def change
    rename_table :games, :cricket_games
  end
end
