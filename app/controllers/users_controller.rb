class UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(params.require(:user).permit(:username, :password, :full_name, :phone, :address, :date_of_membership, :total_checkout))
  	session[:user_id] = @user.id
  	puts "NEW USER CREATED"
  	redirect_to '/welcome', notice: "New user created"

  end
end
