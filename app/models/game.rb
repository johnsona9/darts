class Game < ApplicationRecord
  attr_accessor :player_one_15, :player_two_15, :player_one_16, :player_two_16, :player_one_17, :player_two_17, :player_one_18, :player_two_18, :player_one_19, :player_two_19, :player_one_20, :player_two_20, :player_one_be, :player_two_be, :player_one_score, :player_two_score
  validates :player_one, :player_two, presence: true
  validate :check_player_one_and_player_two

  def check_player_one_and_player_two
    errors.add(:player_one, 'You cannot play against yourself') if player_one == player_two
  end

  def game_over?
    if all_closed?('one') && self[:player_one_score] > self[:player_two_score]
      true
    elsif all_closed?('two') && self[:player_two_score] > self[:player_one_score]
      true
    else
      false
    end
  end

  private

    def all_closed?(player_num)
      player = "player_#{player_num}_"
      returner = true
      returner = self[player + '15'] >= 3 && returner
      returner = self[player + '16'] >= 3 && returner
      returner = self[player + '17'] >= 3 && returner
      returner = self[player + '18'] >= 3 && returner
      returner = self[player + '19'] >= 3 && returner
      returner = self[player + '20'] >= 3 && returner
      returner = self[player + 'be'] >= 3 && returner
    end
end
