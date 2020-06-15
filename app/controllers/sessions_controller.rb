class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
  	@user = User.find_by(username: params[:username])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		puts 'Logged In'
  		redirect_to '/books'
  	else
  		redirect_to '/login'
  	end
  end

  def login
  	@user = User.new
  end

  def welcome
  end

  def page_requires_login

  end

  def destroy
  	session[:user_id] = nil
  	redirect_to 'welcome', notice: "Logged Out"
  end

  def loggedOut

  end

end
