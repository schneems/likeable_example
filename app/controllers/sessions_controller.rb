class SessionsController < ApplicationController
  skip_before_filter :authenticate!, :only => :new

  def new
  end

  def create
    redirect_to root_path if authenticated?
  end

  def destroy
    redirect_to :action => :new if logout
  end
end
