class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
   @user = User.new(user_params)
   
   if @user.save
     flash[:success] = 'Welcome! You have signed up successfully.'
     redirect_to user_path(@user.id)
   else
     render:index
   end
 end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id) ,notice:"You have updated user successfully."
    else
      render:edit
    end
    
  end
  
  def index
    @user = current_user
    @users = User.all
  end
  
  private

def user_params
  params.require(:user).permit(:name,:profile_image,:introduction)
end
  
end
