class PlayersController < ApplicationController
  def index
    @players = Player.all
    @latest_notes = Note.limit(5).order(note_date: :desc)
    # byebug
  end

  def show
  end
end
