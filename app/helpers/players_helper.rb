require "nokogiri"
require "open-uri"
# require "pry"
require "byebug"

module PlayersHelper
  def self.getAllPlayers
    players_hash = []
    ["a", "z"].each do |letter| #TODO: uncomment to only get players with last name in array (for development/testing)
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
    @players = Player.all

    if @players.count != 0
      @players.each do |player|
        players_url = "https://www.basketball-reference.com/players/news.fcgi?id=" + player.player_api_id + "&rss=1"

        html = open(players_url)
        
        doc = Nokogiri::XML(html)

        players = doc.xpath("//item")

        players.each do |p| 
          note_date = p.children[7].text
          note_preview = p.children[5].text
          note_link = p.children[3] ? p.children[3].text : nil
          
          if note_date.split("-")[1] === "01" &&  note_date.split("-")[0] === "2022" #only retrieve notes from Jan, 2022
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

    player_notes
  end

  def self.getNewNotes
    new_player_notes = []

    # 1. get last note_date fron notes table for all players from subscriptions table    
    my_players = Player.where(id: [2, 3, 5])
    notes = Note.all
    my_players.each do |p|
      notes = Note.where(id: p.id)

      player_url = "https://www.basketball-reference.com/players/news.fcgi?id=" + p.player_api_id + "&rss=1"

      html = open(player_url)
        
      doc = Nokogiri::XML(html)

      player = doc.xpath("//item")

      # 2. fetch all notes since last note_date from step#1
      player_note_date = player.children[7].text

      # byebug
      if Date.parse(notes[0].note_date) > Date.parse(player_note_date)
        # 3. send notification there are new notes for list of players from step#1
        # twilio test
        # NotificationHelper::sendText("new notes have been detected!", "+16478211942")
        # email test
        # NewNoteNotification.send_email("abdi.elmi@rocketmail.com").deliver
        # 4. save notes to DB ex. Note.create!(player_note)
      end
    end
    new_player_notes
  end
end


# testing
# PlayersHelper::getPlayerNotes()
# PlayersHelper::getAllPlayers()
PlayersHelper::getNewNotes()
# byebug
