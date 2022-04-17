# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # @image_element = @category.image_elements.build
  end

  def show
    @category = Category.includes(:books).find([params[:id]])
    # @category = Category.find(params[:id])
    # @book = if params.key?(:category_id)
    #           Book.where(category_id: params[:category_id])
    #         else
    #           Book.find(params[:id])
    #         end
    # @book = Book.where(category_id: params[:category_id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def update
    @category = Category.find_by(genre: params[:genre])

    if @category.update(category_params)
      redirect_to @category
      # redirect_to books_url
    else
      render :edit, status: :unprocessable_entity

    end
    #   render json: CategorySerializer.new(category, options).serialized_json
    # else
    #   render json: { error: category.errors.messages }, status: 422
    # end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:genre, :image_url, :image)
  end
end
