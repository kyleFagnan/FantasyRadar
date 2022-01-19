class AddPlayerApiIdColumn < ActiveRecord::Migration
  def change
    add_column :player_notes, :player_api_id, :string
  end
end
