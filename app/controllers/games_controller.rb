class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      flash.now[:danger] = 'player names not valid, please try again'
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def update_player
    send('player_' + params[:player] + '_' + params[:score])
  end

  private
    def player_one_15
      @game = Game.find(params[:id])
      if @game.player_one_15 < 3 || @game.player_two_15 < 3
        @game.player_one_15 += 1
      end
      if @game.player_one_15 > 3 && @game.player_two_15 < 3
        @game.player_one_score += 15
      end
      redirect_to @game if @game.save
    end

    def player_two_15
      @game = Game.find(params[:id])
      if @game.player_two_15 < 3 || @game.player_one_15 < 3
        @game.player_two_15 += 1
      end
      if @game.player_two_15 > 3 && @game.player_one_15 < 3
        @game.player_two_score += 15
      end
      redirect_to @game if @game.save
    end

    def player_one_16
      @game = Game.find(params[:id])
      if @game.player_one_16 < 3 || @game.player_two_16 < 3
        @game.player_one_16 += 1
      end
      if @game.player_one_16 > 3 && @game.player_two_16 < 3
        @game.player_one_score += 16
      end
      redirect_to @game if @game.save
    end

    def player_two_16
      @game = Game.find(params[:id])
      if @game.player_two_16 < 3 || @game.player_one_16 < 3
        @game.player_two_16 += 1
      end
      if @game.player_two_16 > 3 && @game.player_one_16 < 3
        @game.player_two_score += 16
      end
      redirect_to @game if @game.save
    end

    def player_one_17
      @game = Game.find(params[:id])
      if @game.player_one_17 < 3 || @game.player_two_17 < 3
        @game.player_one_17 += 1
      end
      if @game.player_one_17 > 3 && @game.player_two_17 < 3
        @game.player_one_score += 17
      end
      redirect_to @game if @game.save
    end

    def player_two_17
      @game = Game.find(params[:id])
      if @game.player_two_17< 3 || @game.player_one_17 < 3
        @game.player_two_17 += 1
      end
      if @game.player_two_17 > 3 && @game.player_one_17 < 3
        @game.player_two_score += 17
      end
      redirect_to @game if @game.save
    end

    def player_one_18
      @game = Game.find(params[:id])
      if @game.player_one_18 < 3 || @game.player_two_18 < 3
        @game.player_one_18 += 1
      end
      if @game.player_one_18 > 3 && @game.player_two_18 < 3
        @game.player_one_score += 18
      end
      redirect_to @game if @game.save
    end

    def player_two_18
      @game = Game.find(params[:id])
      if @game.player_two_18 < 3 || @game.player_one_18 < 3
        @game.player_two_18 += 1
      end
      if @game.player_two_18 > 3 && @game.player_one_18 < 3
        @game.player_two_score += 18
      end
      redirect_to @game if @game.save
    end

    def player_one_19
      @game = Game.find(params[:id])
      if @game.player_one_19 < 3 || @game.player_two_19 < 3
        @game.player_one_19 += 1
      end
      if @game.player_one_19 > 3 && @game.player_two_19 < 3
        @game.player_one_score += 19
      end
      redirect_to @game if @game.save
    end

    def player_two_19
      @game = Game.find(params[:id])
      if @game.player_two_19 < 3 || @game.player_one_19 < 3
        @game.player_two_19 += 1
      end
      if @game.player_two_19 > 3 && @game.player_one_19 < 3
        @game.player_two_score += 19
      end
      redirect_to @game if @game.save
    end

    def player_one_20
      @game = Game.find(params[:id])
      if @game.player_one_20 < 3 || @game.player_two_20 < 3
        @game.player_one_20 += 1
      end
      if @game.player_one_20 > 3 && @game.player_two_20 < 3
        @game.player_one_score += 20
      end
      redirect_to @game if @game.save
    end

    def player_two_20
      @game = Game.find(params[:id])
      if @game.player_two_20 < 3 || @game.player_one_20 < 3
        @game.player_two_20 += 1
      end
      if @game.player_two_20 > 3 && @game.player_one_20 < 3
        @game.player_two_score += 20
      end
      redirect_to @game if @game.save
    end

    def player_one_be
      @game = Game.find(params[:id])
      if @game.player_one_be < 3 || @game.player_two_be < 3
        @game.player_one_be += 1
      end
      if @game.player_one_be > 3 && @game.player_two_be < 3
        @game.player_one_score += 25
      end
      redirect_to @game if @game.save
    end

    def player_two_be
      @game = Game.find(params[:id])
      if @game.player_two_be < 3 || @game.player_one_be < 3
        @game.player_two_be += 1
      end
      if @game.player_two_be > 3 && @game.player_one_be < 3
        @game.player_two_score += 25
      end
      redirect_to @game if @game.save
    end

    def game_params
      params.require(:game).permit(:player_one, :player_two)
    end
end
