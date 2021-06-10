class UsersController < ApplicationController
  def index
    @new_book = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @books = Book.includes(:favorite_users).sort {|a,b| b.favorite_users.size <=> a.favorite_users.size}
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render 'books/index'
    end
  end


  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.order('created_at DESC')
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
