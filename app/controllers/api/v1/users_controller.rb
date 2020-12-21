class Api::V1::UsersController < ApplicationController
  before_action :login_required, :only => :my_account
  def login 
    byebug
    @user = User.new
    @user.username = params[:username]  
    byebug
  end

  def process_login
    if user = User.authenticate(params[:user])
      #assign session id to user
      session[:id] = user.id 
      # redirect
    else
      flash[:error] = "Invalid login."
      # redirec
    end
  end

  def my_account 
    # find user by session id
  end

  def logout 
    reset_session
    flash[:message] = "Logged out."
    # add redirect
  end

  def create

  end



end
