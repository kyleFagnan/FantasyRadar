class AddPlayeraipidToNote < ActiveRecord::Migration
  def change
    add_column :notes, :player_api_id, :string
  end
end
