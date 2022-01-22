class Player < ActiveRecord::Base
  has_many :subscriptions
  has_many :notes, dependent: :delete_all
end
