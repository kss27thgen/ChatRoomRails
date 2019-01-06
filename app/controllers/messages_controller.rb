class MessagesController < ApplicationController
  before_action :set_group, only: [:create, :index, :destroy]

  def create
  # パターン１
    # @message = @group.messages.new(message_params)
    # if @message.save
  # パターン２
    # if @group.messages.create(message_params)
  # パターン３(上２つならmessage_paramsに「group_id」のマージ不要)

    if !GroupUser.exists?(user_id: current_user.id, group_id: params[:group_id])
      redirect_to group_messages_path(@group), notice: '投稿するにはルームに入りましょう'
    elsif @message = Message.create(message_params)
      redirect_to group_messages_path(@group)
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  def index
    @message = Message.new
    @your_groups = current_user.groups.order('updated_at DESC')
    @messages = @group.messages.includes(:user)
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to group_messages_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
