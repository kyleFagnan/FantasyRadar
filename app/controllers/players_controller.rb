class PlayersController < ApplicationController
  def index
    @players = Player.all
    # @notes = Note.find(@player)
    # byebug
  end

  def show
  end
end
