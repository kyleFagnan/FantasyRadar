class AddTransactionTypeInSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :trans_type, :boolean
  end
end
