class LoginController < ApplicationController
  def create
  	user = User.find_by(email: params[:email])
  	if user && @user.authenticate(params[:password])
     log_in user
     redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
  	  render 'new'
  	 end
  end

   def new
     # @login = Login.new
   end
end
