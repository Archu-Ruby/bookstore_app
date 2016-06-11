class BooksController < ApplicationController
  def new
    @page_title= 'Add Book'
    @book = Book.new
    @category = Category.new
    @publisher= Publisher.new
    @author = Author.new
  end
  def create
    @book=Book.new(book_params)
    if @book.save
       flash[:notice]= "Book is sucessfully created"
       redirect_to  books_path
    else
      render 'new'
    end
  end
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    flash[:notice]= "Book is sucessfully updated"
    redirect_to  books_path
    render 'edit'
  end
  def edit
    @book=Book.find(params[:id])
  end
  def destroy
    @book=Book.find(params[:id])
    @book.delete
    flash[:notice]= "Book is sucessfully deleted"
    redirect_to  books_path
  end
  def index
    @books=Book.all
    @categories=Category.all
  end
  def show
    @book=Book.find(params[:id])
    @categories=Category.all
  end
  private
  def book_params
    params.require(:book).permit(:title,:category_id,:author_id,:publisher_id,:isbn,:price,:but,:coverpath,:format,:excerpt,:pages)
  end
end