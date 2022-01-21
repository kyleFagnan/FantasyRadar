class Admin::PlayerNotesController < ApplicationController
  def index
    @fake_notes =  Faker::Lorem.sentences(number: 6) 
    @players = Player.all.limit(6) ;
    @test_data = []
    i = 0
    @players.each do |p|
      @test_data << {
        player_api_id: p.player_api_id,
        note_preview: @fake_notes[i],
        note_date: Date.today.to_s
      }
      i = i + 1
    end
    @test_data
  end
end
