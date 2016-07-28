class Game < ApplicationRecord
  attr_writer :player_one_15, :player_two_15, :player_one_16, :player_two_16, :player_one_17, :player_two_17, :player_one_18, :player_two_18, :player_one_19, :player_two_19, :player_one_20, :player_two_20, :player_one_be, :player_two_be, :player_one_score, :player_two_score
  validates :player_one, :player_two, presence: true
  validate :check_player_one_and_player_two
  before_save :init

  def init
    self.player_one_15 ||= 0
    self.player_two_15 ||= 0

    self.player_one_16 ||= 0
    self.player_two_16 ||= 0

    self.player_one_17 ||= 0
    self.player_two_17 ||= 0

    self.player_one_18 ||= 0
    self.player_two_18 ||= 0

    self.player_one_19 ||= 0
    self.player_two_19 ||= 0

    self.player_one_20 ||= 0
    self.player_two_20 ||= 0

    self.player_one_be ||= 0
    self.player_two_be ||= 0

    self.player_one_score ||= 0
    self.player_two_score ||= 0
  end

  def player_one_15
    @player_one_15 || 0
  end

  def player_two_15
    @player_two_15 || 0
  end

  def player_one_16
    @player_one_16 || 0
  end

  def player_two_16
    @player_two_16 || 0
  end

  def player_one_17
    @player_one_17 || 0
  end

  def player_two_17
    @player_two_17 || 0
  end

  def player_one_18
    @player_one_18 || 0
  end

  def player_two_18
    @player_two_18 || 0
  end

  def player_one_19
    @player_one_19 || 0
  end

  def player_two_19
    @player_two_19 || 0
  end

  def player_one_20
    @player_one_20 || 0
  end

  def player_two_20
    @player_two_20 || 0
  end

  def player_one_be
    @player_one_be || 0
  end

  def player_two_be
    @player_two_be || 0
  end

  def player_one_score
    @player_one_score || 0
  end

  def player_two_score
    @player_two_score || 0
  end


  def check_player_one_and_player_two
    errors.add(:player_one, 'You cannot play against yourself') if player_one == player_two
  end
end
