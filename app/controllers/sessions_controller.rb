class SessionsController < ApplicationController
  before_filter :authenticate!, :except => :new

  def new
  end

  def create
    redirect_to root_path if authenticated?
  end

  def destroy
    redirect_to :action => :new if logout
  end
end
