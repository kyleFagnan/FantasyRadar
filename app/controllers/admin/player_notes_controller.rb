class Admin::PlayerNotesController < ApplicationController
  def new
    @notes = Note.new
  end

  def show
    @note = Note.find(params[:id])
    @player = Player.where(id: @note.player_id)
  end
  
  def create
    # raise note_params.inspect
    @note = Note.new(note_params)
    if @note.save
      sendNotification(@note.player_id)
      redirect_to "/admin/player_notes/#{@note.id}"
    else
      render :new
    end
  
  end

  private
  def note_params
    # raise params.inspect
    params.require(:notes).permit(
    :note_preview,
    :note_date,
    :player_id
    )
  end

  def sendNotification(player_id)
    byebug
    @user = User.find session[:user_id]
    if @user.notification_type == "text"
      NotificationHelper::sendText("new notes have been detected for #{player_id}!", @user.phone_number)
    elsif @user.notification_type == "email"
      NewNoteNotification.send_email(@user.email).deliver
    end
  end
end
