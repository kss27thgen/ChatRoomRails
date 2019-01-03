class MessagesController < ApplicationController
  before_action :set_group

  def create
  # パターン１
    # @message = @group.messages.new(message_params)
    # if @message.save
  # パターン２
    # if @group.messages.create(message_params)
  # パターン３(上２つならmessage_paramsに「group_id」のマージ不要)
    if @message = Message.create(message_params)

      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
