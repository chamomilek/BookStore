
    class BooksController < ApplicationController

      def index
        @books = Book.all
      end

      def show
        # @book = Book.find_by(:category_id => [:category_id])
        @book = Book.find(params[:id])
      end

      def new
        @book = Book.new
      end


      def create
        @book = Book.new(book_params)
        if @book.save
          flash[:notice] = "Book was successfully created."
          redirect_to @book
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @book = Book.find(params[:id])
      end

      def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
          redirect_to @book
        else
          render :edit, status: :unprocessable_entity

        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_url, status: :see_other
      end

      private

      def book_params
        params.require(:book).permit(:title, :description, :images, :price, :pages, :language, :dimension,
                                     :publication_date, :weight, :category_id )
      end
    end

