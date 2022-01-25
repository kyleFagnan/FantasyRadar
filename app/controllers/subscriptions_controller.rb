class SubscriptionsController < ApplicationController
  def index
    @my_subscriptions = Subscription.where(user_id: session[:user_id])
    @my_players = []
    @my_subscriptions.each do |sub|
    @my_players << Player.where(id: sub.player_id)
    end
  end

  def create 
    if !Subscription.exists?(subscription_params)
    
    @subscription = Subscription.create(subscription_params)
    redirect_to "/subscriptions"
  else
    redirect_to "/subscriptions"
  end
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