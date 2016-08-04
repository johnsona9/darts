module UsersHelper
  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def games_played(id = nil)
    user = id.nil? ? User.find(params[:id]) : User.find(id)
    games_one = Game.where(player_one: user.id)
    games_two = Game.where(player_two: user.id)
    @games_played = games_one + games_two
  end

  def hit_percentage
    user = User.find(params[:id])
    games_one = Game.where(player_one: user.id)
    games_two = Game.where(player_two: user.id)

    player_15 = games_one.pluck(:player_one_15).compact.sum + games_two.pluck(:player_two_15).compact.sum
    player_16 = games_one.pluck(:player_one_16).compact.sum + games_two.pluck(:player_two_16).compact.sum
    player_17 = games_one.pluck(:player_one_17).compact.sum + games_two.pluck(:player_two_17).compact.sum
    player_18 = games_one.pluck(:player_one_18).compact.sum + games_two.pluck(:player_two_18).compact.sum
    player_19 = games_one.pluck(:player_one_19).compact.sum + games_two.pluck(:player_two_19).compact.sum
    player_20 = games_one.pluck(:player_one_20).compact.sum + games_two.pluck(:player_two_20).compact.sum
    player_be = games_one.pluck(:player_one_be).compact.sum + games_two.pluck(:player_two_be).compact.sum

    percents = { 15=> player_15, 16=> player_16, 17=> player_17, 18=> player_18, 19=> player_19, 20=> player_20, be: player_be }
  end

  def winner(game)
    player_one_score = game[:player_one_score] || 0
    player_two_score = game[:player_two_score] || 0
    if player_one_score > player_two_score && params[:id].to_i == game[:player_one]
      return @winner = 'Win'
    elsif player_one_score < player_two_score && params[:id].to_i == game[:player_one]
      return @winner = 'Loss'
    elsif player_one_score > player_two_score && params[:id].to_i == game[:player_two]
      return @winner = 'Loss'
    elsif player_one_score < player_two_score && params[:id].to_i == game[:player_two]
      return @winner = 'Win'
    else
      return ''
    end
  end
end
