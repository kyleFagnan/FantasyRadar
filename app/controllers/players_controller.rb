class PlayersController < ApplicationController
  def index
    @players = Player.all

    @notes = Note.all.order(note_date: :desc)
    # byebug
    @latest_notes = Note.limit(5).order(note_date: :desc)
  end



  def show
    @player = Player.find params[:id]
  end

  def search
    term = params[:search].split("=").last
    @players = Player.search(term.strip)
    render json: @players
  end
end
