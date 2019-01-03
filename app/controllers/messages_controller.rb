class MessagesController < ApplicationController
  before_action :set_group

  def create
    @message = @group.messages.new(message_params)
    if @message.save
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
    @messages = [
      "Lorem ipsum dolor sit amet, consectetur. ipsum dolor.",
      "Lorem",
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum! ipsum dolor sit amet, consectetur adipisicing elit. Sapiente expedita, iusto!",
      "Lorem ipsum dolor.",
      "Lorem ipsum dolor sit amet, consectetur.",
      "Lorem",
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et velit, quas unde amet laborum fugiat recusandae aperiam quidem.",
      "Lorem ipsum, consectetur adipisicing elit. Quos!",
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, veniam, facilis! Aut accusamus eos excepturi rerum sit, eveniet ducimus quod. ipsum dolor sit amet, consectetur adipisicing elit. Neque quasi quia hic, illum facere Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, veniam, facilis!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, veniam, facilis! Aut accusamus eos excepturi rerum sit, eveniet ducimus quod. ipsum dolor sit amet, consectetur adipisicing elit. Neque quasi quia hic, illum facere Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, veniam, facilis! Aut accusamus eos excepturi rerum sit, eveniet ducimus quod. ipsum dolor sit amet, consectetur adipisicing elit. Neque quasi quia hic, illum facere itaque ut magni at maiores modi illo quod.",
      "Lorem ipsum dolor sit amet.",
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. -fin-"
    ]

  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

end
