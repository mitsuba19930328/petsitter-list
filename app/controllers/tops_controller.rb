class TopsController < ApplicationController
  skip_before_action :login_required

  def index
    @user = current_user
    @users = User.all
  end

end
