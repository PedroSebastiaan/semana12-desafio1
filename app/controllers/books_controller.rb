class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update]
  before_action :set_selects, only: %i[new edit create update]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html{ redirect_to @book, notice: 'Successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html {redirect_to @book, notice: 'Successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def show
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
  
  def set_selects
    @statuses = Book.statuses.keys.to_a
  end

  def book_params
    params.require(:book).permit(:title, :author, :status, :lending_date, :return_date)
  end

end
