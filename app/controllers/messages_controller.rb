class MessagesController < ApplicationController

  def index
    @users = User.all
    @groups = current_user.groups

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
    @rooms = [
      {name:"room1", message: "Lorem ipsum dolor sit amet"},
      {name:"room2", message: "Lorem"},
      {name:"room3", message: "Lorem ipsum dolor"},
      {name:"room4", message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et velit, quas unde amet laborum fugiat recusandae aperiam quidem."},
      {name:"room5", message: "Lorem ipsum dolor"},
      {name:"room6", message: "Lorem ipsum dolor sit amet, consectetur."},
      {name:"room7", message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, veniam, facilis! Aut accusamus eos excepturi rerum sit, eveniet ducimus quod. ipsum dolor sit amet, consectetur adipisicing elit. Neque quasi quia hic, illum facere itaque ut magni at maiores modi illo quod."},
      {name:"room8", message: "Lorem ipsum dolor sit -fin-"}
    ]
  end

end
