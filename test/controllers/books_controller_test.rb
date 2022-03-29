# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @title = "The Great Book #{rand(1000)}"
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should get new' do
    get new_book_url
    assert_response :success
  end

  test 'should create book' do

    assert_difference('Book.count', 0) do
      post books_url, params: { book: { title: @book.title,
                                        description: @book.description,
                                        images: @book.images,
                                        price: @book.price,
                                        pages: @book.pages,
                                        language: @book.language,
                                        dimensions: @book.dimensions,
                                        publication_date: @book.publication_date,
                                        weight: @book.weight,
                                        category_id: @book.category_id } }
    end

    assert_redirected_to books_url(Book.last)
  end

  test 'should show book' do
    book = books(:one)
    get book_url(book)
    assert_response :success
  end

  test 'should get edit' do
    get edit_book_url(@book)
    assert_response :success
  end

  test 'should update book' do
    patch book_url(@book), params: { book: { title: @title,
                                             description: @book.description,
                                             images: @book.images,
                                             price: @book.price,
                                             pages: @book.pages,
                                             language: @book.language,
                                             dimensions: @book.dimensions,
                                             publication_date: @book.publication_date,
                                             weight: @book.weight,
                                             category_id: @book.category_id } }
    assert_redirected_to book_url(@book)
    # @book.reload
    # assert_equal 'updated', @book.title
  end

  test 'cant delete book in cart' do
    assert_difference('Book.count', 0) do
      delete book_url(books(:two))
    end

    assert_redirected_to books_url
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
