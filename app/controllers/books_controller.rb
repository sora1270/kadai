class BooksController < ApplicationController
  def create
  @book = Book.new(book_params)
   if @book.save
    flash[:notice] = 'Book was successfully created.'
    redirect_to book_path(@book)
   else
    @books = Book.all
    flash.now[:danger] = 'Errors prohibited this book from being saved.'
    render :index
   end
  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    flash.now[:notice] = 'Book was successfully created.' if flash[:notice].present?
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  redirect_to book_path(@book.id)
  end
  
  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  def top
  end

  private

  def book_params
     params.require(:book).permit(:title, :body)
  end
 end
