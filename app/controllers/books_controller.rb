
    class BooksController < ApplicationController

      def index
        @books = Book.all
      end

      def show
         @book = Book.find(params[:id])
      end


      def create
        @book = Book.new(book_params)
        if @book.save
          render json: BookSerializer.new(@book).serialized_json
        else
          render json: {error: @book.errors.messages}, status: 422
        end
      end

      def update
        @book = Book.find_by(params[:title])

        if @book.update(book_params)
          render json: BookSerializer.new(@book).serialized_json
        else
          render json: {error: @book.errors.messages}, status: 422
        end
      end

      def destroy
        book = Book.find(params[:id])
        if book.destroy
          head :no_content
        else
          render json: {error: book.errors.messages}, status: 422
        end
      end

      private

      def book_params
        params.require(:book).permit(:title, :description, :images, :price, :pages, :language, :dimension,
                                     :publication_date, :weight, :category_id )
      end
    end

