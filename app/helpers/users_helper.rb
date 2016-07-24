module UsersHelper
  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def games_played
    user = User.find(params[:id])
    games_one = Game.where(player_one: user.id)
    games_two = Game.where(player_two: user.id)
    games_player = games_one + games_two
  end
end
