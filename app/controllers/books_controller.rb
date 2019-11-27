class BooksController < ApplicationController
  def top
  end
  def show
  	@book =Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book =  Book.new
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save(book_params)
  		flash[:notice] = "successfully"
  	redirect_to book_path(@book.id)
  else
  	@books = Book.all
  	render action: :index
   end
  end

  def edit
  	@book = Book.find(params[:id])
  # 	if @book.edit(book_params)
  # 		flash[:notice] = "successfully"
  # 	redirect_to book_path(@book)
  # else
  # 	@books = Book.all
  # 	render action: :index
  #  end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	flash[:notice] = "successfully"
  	redirect_to book_path(@book)
  	else
  	# @books = Book.all
  	render action: :edit
  end
end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	flash[:notice] = "successfully"
  	redirect_to books_path

  end

  private
   def book_params
   	params.require(:book).permit(:title,:body)
   end
end
