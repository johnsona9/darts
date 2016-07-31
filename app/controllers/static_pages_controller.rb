class StaticPagesController < ApplicationController
  def home
    @games = Game.last(15).reverse
  end

  def help
  end
end
