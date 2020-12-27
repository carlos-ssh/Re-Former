class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
      flash[:notice] = 'Signed Up Succesfully!'
      flash[:color] = 'valid'
    else
      render :new
      flash[:notice] = 'Form is Invalid :('
      flash[:color] = 'invalid'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
