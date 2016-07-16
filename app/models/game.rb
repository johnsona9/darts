class Game < ApplicationRecord
  attr_accessor :player_one_15, :player_two_15, :player_one_16, :player_two_16, :player_one_17, :player_two_17, :player_one_18, :player_two_18, :player_one_19, :player_two_19, :player_one_20, :player_two_20, :player_one_be, :player_two_be
  validates :player_one, :player_two, presence: true, length: { maximum: 20 }
end
