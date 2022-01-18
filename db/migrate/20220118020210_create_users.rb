class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.string :notification_type
      t.timestamps null: false
    end
  end
end
