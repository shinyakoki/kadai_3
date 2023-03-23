class BooksController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
     @user = current_user
     @books = Book.all
      render :index
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.new
    @book1 = Book.find(params[:id])
    @user = @book1.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
      render :edit
    end  
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def
    correct_user
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user == current_user
  end



end