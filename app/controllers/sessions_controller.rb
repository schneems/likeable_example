class SessionsController < ApplicationController
  skip_before_filter :authenticate!, :only => :new

  def new
  end

  def create
    redirect_to root_path if authenticated?
#    if authenticate
#      redirect_to root_path
#    else
#      flash.now[:error] = warden.message if warden.message.present?
#      render :new
#    end
  end

  def destroy
    redirect_to :action => :new if logout
  end
end
