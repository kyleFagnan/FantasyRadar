class PlayersController < ApplicationController
  def index
    @players = Player.all

    @notes = Note.all.order(note_date: :desc)
    @latest_notes = Note.limit(5).order(note_date: :desc)
    # PlayersHelper::getNewNotes()
  end



  def show
    @player = Player.find params[:id]
    if session[:user_id]
      @user = User.find session[:user_id]
      my_subscriptions = Subscription.where(user_id: session[:user_id])
      my_subscriptions.each do |sub|
        if(@player.id.to_s == sub.player_id)
          @subscribed_player_exist = true
          break;
        end
      end
    end
  end

  def search
    term = params[:search].split("=").last
    @players = Player.search(term.strip)
    render json: @players
  end
end
