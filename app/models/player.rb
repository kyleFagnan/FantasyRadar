class Player < ActiveRecord::Base
  has_many :Subscription
  has_many :notes, dependent: :delete_all
end
