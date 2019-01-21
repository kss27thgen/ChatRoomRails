class HomeController < ApplicationController

  def top
    @your_groups = current_user.groups.order('updated_at DESC')
  end

end
