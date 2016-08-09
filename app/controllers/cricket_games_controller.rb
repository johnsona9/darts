class CricketGamesController < ApplicationController
  PLAYERS = ['one', 'two']

  def new
    @game = CricketGame.new
    if authenticated_one? && authenticated_two?
      @game['player_one'] = @current_user_one.id
      @game['player_two'] = @current_user_two.id
      if @game.save
        redirect_to @game
      else
        flash[:danger] = 'There was an error, please try again.'
        redirect_to root_path
      end
    else
      flash[:danger] = 'Two players to be signed in to start a game.'
      redirect_to root_path
    end
  end

  def index
    @games = CricketGame.paginate(page: params[:page])
  end

  def show
    @game = CricketGame.find(params[:id])
    @player_one_name = User.find(@game.player_one).name
    @player_two_name = User.find(@game.player_two).name
  end

  def update_player
    @game = CricketGame.find(params[:id])
    if (current_user_one && current_user_one.id == @game.player_one) && (current_user_two && current_user_two.id == @game.player_two)
      other_player = params[:player] == 'one' ? PLAYERS[1] : PLAYERS[0]
      main_score = @game['player_' + params[:player] + '_' + params[:score]]
      other_score = @game['player_' + other_player + '_' + params[:score]]
      if main_score > 2 && other_score < 3
        initial_score = @game[('player_' + params[:player] + '_score')]
        @game[('player_' + params[:player] + '_score')] = initial_score + params[:score].to_i
      end
      if main_score < 3 || other_score < 3
        initial_score = @game[('player_' + params[:player] + '_' + params[:score])]
        @game[('player_' + params[:player] + '_' + params[:score])] = initial_score + 1
      end
      @game.save
    end
  end

    def game_params
      params.require(:game)
    end
end
