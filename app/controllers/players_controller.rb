class PlayersController < ApplicationController
  def index
    @players = Player.all.order(player_api_id: :asc)
  end

  def show
  end
end
