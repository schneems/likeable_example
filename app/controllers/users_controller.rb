class UsersController < ApplicationController
  before_filter :user_authenticate!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Updated successfully'
      redirect_to root_path
    else
      render :edit
    end
  end
end
