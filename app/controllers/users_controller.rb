class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))

  	if @user.save
  		redirect_to products_url, :notice => "Welcome!"
  	else
  		render "new"
  	end
  end
end
