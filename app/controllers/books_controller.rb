class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def new
    @book = Book.new
  end
  
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
    redirect_to book_path(@book_new.id),notice:"You have created book successfully."
    else
    @books = Book.all
    @user = current_user
    render:index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @book_new = Book.new
    @books = Book.all
    @users = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to book_path(@book.id)
    else
     if @book.update(book_params)
     redirect_to book_path(@book.id),notice:"You have updated book successfully."
     else
      render:edit
     end
   end
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to book_path(@book.id)
    else
    @book.destroy
    redirect_to books_path
   end
  end
  
   private
  def book_params
    params.require(:book).permit(:title, :body, :image)  
  end
  
end
