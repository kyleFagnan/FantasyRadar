class User < ActiveRecord::Base
  has_many :Subscription
end
