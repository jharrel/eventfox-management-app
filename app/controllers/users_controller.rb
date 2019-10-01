class UsersController < ApplicationController

  def new
<<<<<<< HEAD
       @user = User.new
=======
      @user = User.new
>>>>>>> 58d4f89ff31e7f1dfb4d979de4fca86518984a15
      render layout: 'sessions'
  end

  def create

    @user = User.new(user_params)

    if @user.save

      session[:user_id] = @user.id
      redirect_to projects_path
    else
      render :new, layout: 'sessions'
    end

  end

  private


  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
