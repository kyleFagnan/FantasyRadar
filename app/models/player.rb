class Player < ActiveRecord::Base
  has_many :subscription
  has_many :notes, dependent: :delete_all

  def self.search(search)
    if search
          searchStr = search.downcase
          @searchedPlayer = Player.where("lower(player_name) LIKE ?", "%#{searchStr}%")
    else
      @searchedPlayer = Player.all
    end
    @searchedPlayer
  end
end
