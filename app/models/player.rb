class Player < ActiveRecord::Base
  has_many :Subscription
  has_many :notes, dependent: :delete_all

  def self.search(search)
    if search
          @searchedPlayer = Player.where("player_name LIKE ?", "%#{search}%")
    else
      @searchedPlayer = Player.all
    end
    @searchedPlayer
  end
end
