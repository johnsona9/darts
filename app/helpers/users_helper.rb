module UsersHelper
  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def games_played
    user = User.find(params[:id])
    games_one = Game.where(player_one: user.id)
    games_two = Game.where(player_two: user.id)
    @games_played = games_one + games_two
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
