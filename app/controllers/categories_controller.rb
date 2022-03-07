# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find_by(genre: params[:genre])

    if category.update(category_params)
      render json: CategorySerializer.new(category, options).serialized_json
    else
      render json: { error: category.errors.messages }, status: 422
    end
  end

  def destroy
    category = Category.find_by(genre: params[:genre])

    if category.destroy
      head :no_content
    else
      render json: { error: category.errors.messages }, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:genre, :image_url)
  end

  # def options
  #   @options ||= {include: %i[books]}
  # end
end
