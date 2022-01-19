class RemovePlayerFromNotes < ActiveRecord::Migration
  def change
    remove_reference :notes, :player, index: true, foreign_key: true
  end
end
