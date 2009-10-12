class UsersController < ApplicationController
  before_filter :sign_in_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = 'Updated successfully'
      redirect_to root_path
    else
      render :edit
    end
  end
end
