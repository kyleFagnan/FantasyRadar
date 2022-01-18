require "nokogiri"
require "open-uri"
# require "pry"
require "byebug"

module PlayersHelper
  def self.player_urls
    players_hash = []
    ("a".."z").each do |letter| 
      players_url = "https://www.basketball-reference.com/players/" + letter 
  
      html = open(players_url)
      
      doc = Nokogiri::HTML(html)
      
      players = doc.css("#players").css("tbody").css("tr").css("th")
  
      players.each do |player| 
        player_id = player.attribute("data-append-csv").value
        name = player.children.text
        players_hash << [name, player_id]
        # byebug
      end
    end
    
    players_hash
  end
end
