class User < ActiveRecord::Base
  has_secure_password
  has_many :Subscription
  has_secure_password validations: false
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: { minimum: 5 }
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_confirmation_of :password
  validates_presence_of :password_confirmation
  def self.authenticate_with_credentials(email, password)
    user = User.where("lower(email) = ?", email.strip.downcase).first.try(:authenticate, password)
  end
end
