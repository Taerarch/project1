class ListsController < ApplicationController
before_action :check_for_login, :only => [:new, :create, :edit]
before_action :check_for_admin, :only => [:destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find params[:id]
  end

  def new
    @list = List.new
  end

  def create
    list = List.create list_params
    redirect_to list
  end

  def edit
    @list = List.find params[:id]
  end

  def update
    list = List.find params[:id]
    list.update list_params
    redirect_to list
  end

  def destroy
    list = List.find params[:id]
    list.destroy
    redirect_to lists_path
  end

  def add
    list = List.find params[:list_id]
    book = Book.find params[:book_id]
    list.books << book
    redirect_to list
  end


  private
  def list_params
    params.require(:list).permit(:title, :user_id)

  end
end
