class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def
    correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end




