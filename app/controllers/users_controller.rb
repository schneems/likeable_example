class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # Could be splitted in two actions
    method = params[:user][:password] ? :update_with_password : :update_attributes
    if @user.send(method, params[:user])
      flash[:notice] = 'Updated successfully'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    sign_out current_user
    flash[:notice] = t('flash.users.destroy.notice', :default => 'User was successfully destroyed.')
    redirect_to root_path
  end
end
