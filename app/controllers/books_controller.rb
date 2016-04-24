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
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show

  end
  private
  def book_params
    params.require(:book).permit(:title,:category_id,:author_id,:publisher_id,:isbn,:price,:but,:format,:excerpt,:pages)
end
end