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
end
