
    class BooksController < ApplicationController

      def index
        @books = Book.all
      end

      def show
         @book = Book.find(params[:id])
      end

      def new
        @book = Book.new
      end


      def create
        @book = Book.new(book_params)
        if @book.save
          redirect_to @article
          # render json: BookSerializer.new(@book).serialized_json
        else
          render :edit, status: :unprocessable_entity
          # render json: {error: @book.errors.messages}, status: 422
        end
      end

      def edit
        @book = Book.find(params[:id])
      end

      def update
        @book = Book.find_by(params[:id])

        if @book.update(book_params)
          redirect_to @article
          # render json: BookSerializer.new(@book).serialized_json
        else
          render :edit
          # render json: {error: @book.errors.messages}, status: 422
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @books.destroy
        redirect_to root_path, status: :see_other
        # if book.destroy
          # head :no_content
        # else
        #   render json: {error: book.errors.messages}, status: 422
        # end
      end

      private

      def book_params
        params.require(:book).permit(:title, :description, :images, :price, :pages, :language, :dimension,
                                     :publication_date, :weight, :category_id )
      end
    end

