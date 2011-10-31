class MessagesController < ApplicationController
  
  def create
    @discussion = Discussion.find(params[:discussion_id])
    redirect_to root_url, :notice => t("views.discussions.can_not_participate") unless @discussion.can_participate?(current_user)
    
    @message = Message.new(params[:message])
    @message.user = current_user
    @message.discussion = @discussion
    @message.save
    
    respond_to do |format|
      format.html { redirect_to @message.discussion }
      format.js
    end
  end
  
end