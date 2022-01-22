class SubscriptionsController < ApplicationController
  def index

    # @favourite_notes = Subscription.favourite_notes
    @my_subscriptions = Subscription.where(user_id: session[:user_id])
    @my_players = []
    @my_subscriptions.each do |sub|
      @my_players << Player.where(id: sub.player_id)
    end
  end

  def create 
    @test = Subscription.where(player_id:params[:player_id]).first
    puts @test
    if !@test

    @subscription = Subscription.create(subscription_params)
    
    elsif @test[:trans_type] == true
      @test.update(trans_type: false)

    elsif @test[:trans_type] == false
      @test.update(trans_type: true)
    end

    redirect_to "/"
    
  end

  def destroy
    @player = Subscription.find_by(player_id: params[:id])
    
    
    @player.destroy

    redirect_to subscriptions_path
    # respond_to do |format|
    #   format.html { redirect_to subscriptions_path, notice: 'player removed!' }
    # end
  end
  
  private

  def subscription_params
    params.permit(
    :player_id,
    :trans_type
    ).merge({user_id:session[:user_id]})
  end
end