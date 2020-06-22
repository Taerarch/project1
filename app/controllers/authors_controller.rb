class AuthorsController < ApplicationController
  before_action :check_for_admin, :only => [:destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.create author_params
    redirect_to author
  end

  def edit
    @author = Author.find params[:id]
  end

  def update
    author = Author.find params[:id]
    author.update author_params
    redirect_to author
  end

  def show
    @author = Author.find params[:id]
  end

  def destroy
    author = Author.find params[:id]
    author.destroy
  end

  private
  def author_params
    params.require(:author).permit(:name, :dob, :nationality, :image)
  end
end
