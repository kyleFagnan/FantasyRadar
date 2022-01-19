class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :player, index: true, foreign_key: true
      t.string :note_date
      t.string :link_title #TODO: change to :link
      t.string :note_preview
      
      t.timestamps null: false
    end
  end
end
