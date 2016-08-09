class StaticPagesController < ApplicationController
  def home
    @games = CricketGame.last(10).reverse
  end

  def help
  end
end
