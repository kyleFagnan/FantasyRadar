require "nokogiri"
require "open-uri"
# require "pry"
require "byebug"

module PlayersHelper
  def self.getAllPlayers
    players_hash = []
    ["a", "k", "m"].each do |letter| #TODO: uncomment to only get players with last name in array (for development/testing)
    # ("a".."z").each do |letter| # TODO: uncomment to get all players!
      players_url = "https://www.basketball-reference.com/players/" + letter 
  
      html = open(players_url)
      
      doc = Nokogiri::HTML(html)
      
      players = doc.css("#players").css("tbody").css("tr").css("th")
  
      players.each do |player| 
        if player.children[0].name == "strong"
          player_id = player.attribute("data-append-csv").value
          name = player.children.text
          # byebug
          players_hash << {
            player_name: name, 
            player_api_id: player_id
          }
        end
      end
    end
    
    # byebug
    players_hash
  end

  def self.getPlayerNotes
    player_notes = []
    @players = Player.all #TODO: fix and use the Player model instead of scraping again
    # allPlayers = PlayersHelper::getAllPlayers()
    # https://www.basketball-reference.com/players/news.fcgi?id=aldrila01
    if @players.count != 0
      @players.each do |player|
        # byebug
        # player_api_id = player[1]
        players_url = "https://www.basketball-reference.com/players/news.fcgi?id=" + player.player_api_id 

        # players_url = "https://www.basketball-reference.com/players/news.fcgi?id=aldrila01"
        html = open(players_url).read
        
        doc = Nokogiri::HTML(html)
        # Nokogiri::HTML(open(url).read) 
        players = doc.css(".news_stories").css("li")
        # byebug
        players.each do |p| 
          # player_id = player.id # TODO: this should be Player[:id]
          note_date = p.children[0].text
          note_preview = p.children[4].text
          note_link = p.children[5] ? p.children[5].attribute("href").value : nil
          
          if note_date[0] === "1" # only retrieve notes from Janruary
            player_notes << {
              player_id: player.id, 
              note_date: note_date, 
              note_preview: note_preview, 
              link_title: note_link
            }
          end
        end
      end
    end
    # byebug

    player_notes
  end
end

# testing
PlayersHelper::getPlayerNotes()
# PlayersHelper::getAllPlayers()
# byebug
