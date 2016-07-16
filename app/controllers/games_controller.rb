class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      flash[:danger] = 'player names not valid, please try again'
      render 'new'
    end
  end

  def show
  end

  private
    def game_params
      params.require(:game).permit(:player_one, :player_two)
    end
end
