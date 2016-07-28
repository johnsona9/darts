class GamesController < ApplicationController
  PLAYERS = ['one', 'two']

  def new
    @game = Game.new
    if logged_in_one? && logged_in_two?
      @game['player_one'] = @current_user_one.id
      @game['player_two'] = @current_user_two.id
      if @game.save
        redirect_to @game
      else
        flash.now[:danger] = 'player names not valid, please try again'
        redirect_to root_path
      end
    else
      redirect_to root_path
      flash.now[:danger] = 'need two players to be signed in to start a game'
    end
  end

  def show
    @game = Game.find(params[:id])
    @player_one_name = User.find(@game.player_one).name
    @player_two_name = User.find(@game.player_two).name
  end

  def update_player
    @game = Game.find(params[:id])
    other_player = params[:player] == 'one' ? PLAYERS[1] : PLAYERS[0]
    main_score = @game['player_' + params[:player] + '_' + params[:score]] || 0
    other_score = @game['player_' + other_player + '_' + params[:score]] || 0
    if main_score > 2 && other_score < 3
      initial_score = @game[('player_' + params[:player] + '_score')]
      initial_score ||= 0
      @game[('player_' + params[:player] + '_score')] = initial_score + params[:score].to_i
    end
    if main_score < 3 || other_score < 3
      initial_score = @game[('player_' + params[:player] + '_' + params[:score])]
      initial_score ||= 0
      @game[('player_' + params[:player] + '_' + params[:score])] = initial_score + 1
    end
    redirect_to @game if @game.save
  end

    def game_params
      params.require(:game)
    end
end
