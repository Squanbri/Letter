class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(post_params)
    if @message.save
      RequestMailer.send_request(@message).deliver
      redirect_to root_path
    else
      render new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:message).permit(:company, :body)
  end
end
