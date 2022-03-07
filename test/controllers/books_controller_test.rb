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
    assert_difference('Book.count') do
      post books_url, params: { book: { title: @title,
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

    assert_redirected_to books_path(Book.last)
    assert_equal 'Book was successfully created.', flash[:notice]
  end

  #   test "should create book" do
  #     # binding.pry
  #     assert_difference("Book.count") do
  #       post books_path, params: { book: { title: "Rails",
  #                                         description: "Throughout the series, Harry is described as having his father's perpetually untidy black hair,
  # his mother's bright green eyes, and a lightning bolt-shaped scar on his forehead.
  # He is further described as 'small and skinny for his age' with 'a thin face' and 'knobbly knees',
  #  and he wears Windsor glasses.",
  #                                         images: "",
  #                                         price: 9.10,
  #                                         pages: 300,
  #                                         language: "Russian",
  #                                         dimensions: 100,
  #                                         publication_date: 2019,
  #                                         weight: 540,
  #                                 category_id: "3"} }
  #     end
  #
  #     assert_redirected_to books(Book.last)
  #     binding.pry
  #       assert_equal "Book was successfully created.", flash[:notice]
  #   end

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
    # book = books(:one)
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

  test 'should destroy book' do
    book = books(:one)
    assert_difference('Book.count', -1) do
      delete book_url(book)
    end

    assert_redirected_to books_url
  end
end
