class BooksController < ApplicationController
  def index
    @books = Book.all.order(:title)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create book_params
    redirect_to book
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    book = Book.find params[:id]
    book.update book_params
    redirect_to book
  end

  def show
    @book = Book.find params[:id]
    @lists = List.all
  end

  def destroy
    book = Book.find params[:id]
    if @current_user.admin == true
      book.destroy
      redirect_to books_path
    else
      redirect_to book
    end
  end

  def search
    render :search
  end

  def result
    @book = Book.new
    @title = params[:book_title]
    book_url = "https://www.googleapis.com/books/v1/volumes?q=title:#{@title}"
    info = HTTParty.get book_url
    # raise "Hell"
    @cover = info["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
    @genre = info["items"][0]["volumeInfo"]["categories"]
    @date = info["items"][0]["volumeInfo"]["publishedDate"]
    @synopsis = info["items"][0]["volumeInfo"]["description"]
    render :result
  end




  private
  def book_params
    params.require(:book).permit(:title, :year, :genre, :synopsis, :image, :author_id)
  end
end
