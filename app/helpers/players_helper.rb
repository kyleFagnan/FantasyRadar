require "nokogiri"
require "open-uri"
# require "pry"
require "byebug"

module PlayersHelper
  def self.getAllPlayers
    players_hash = []
    ("a".."z").each do |letter| 
      players_url = "https://www.basketball-reference.com/players/" + letter 
  
      html = open(players_url)
      
      doc = Nokogiri::HTML(html)
      
      players = doc.css("#players").css("tbody").css("tr").css("th")
  
      players.each do |player| 
        if player.children[0].name == "strong"
          player_id = player.attribute("data-append-csv").value
          name = player.children.text
          # byebug
          players_hash << [name, player_id]
        end
      end
    end
    
    # byebug
    players_hash
  end

  def self.getPlayerNotes
    player_notes = []

    allPlayers = PlayersHelper::getAllPlayers()
    # https://www.basketball-reference.com/players/news.fcgi?id=aldrila01

    allPlayers.each do |player|
      player_api_id = player[1]
      players_url = "https://www.basketball-reference.com/players/news.fcgi?id=" + player_api_id 

      # players_url = "https://www.basketball-reference.com/players/news.fcgi?id=aldrila01"
      html = open(players_url).read
      
      doc = Nokogiri::HTML(html)
      # Nokogiri::HTML(open(url).read) 
      players = doc.css(".news_stories").css("li")
      # byebug
      players.each do |player| 
        player_api_id = player_api_id # TODO: this should be Player[:id]
        note_date = player.children[0].text
        note_preview = player.children[4].text
        note_link = player.children[5] ? player.children[5].attribute("href").value : nil
        
        if note_date[0] === "1"
          player_notes << [player_api_id, note_date, note_preview, note_link]
        end
      end
    end
    # byebug

    player_notes
  end
end

# testing
# PlayersHelper::getPlayerNotes()
# PlayersHelper::getAllPlayers()
# byebug
