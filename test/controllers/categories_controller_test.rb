# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    get '/categories/new'
    # assert_difference('Book.count', 0) do
    post '/categories', params: { category: { genre: @category.genre,
                                              image_url: @category.image_url } }

    # assert_response :redirect
    # follow_redirect!
    assert_response :success
  end

  test 'should show category' do
    category = categories(:one)
    get category_url(category)
    assert_response :success
  end
end
