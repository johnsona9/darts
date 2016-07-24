class ChangeUsersToIntegers < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :player_one, :integer
    change_column :games, :player_two, :integer
  end
end
