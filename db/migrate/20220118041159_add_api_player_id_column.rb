class AddApiPlayerIdColumn < ActiveRecord::Migration
  def change
    add_column :players, :player_api_id, :string
  end
end
