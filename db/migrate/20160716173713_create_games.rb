class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :player_one
      t.integer :player_two
      t.integer :player_one_15
      t.integer :player_two_15
      t.integer :player_one_16
      t.integer :player_two_16
      t.integer :player_one_17
      t.integer :player_two_17
      t.integer :player_one_18
      t.integer :player_two_18
      t.integer :player_one_19
      t.integer :player_two_19
      t.integer :player_one_20
      t.integer :player_two_20
      t.integer :player_one_be
      t.integer :player_two_be

      t.timestamps
    end
  end
end
