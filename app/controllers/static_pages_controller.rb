class StaticPagesController < ApplicationController
  def home
    @games = Game.last(10).reverse
  end

  def help
  end
end
