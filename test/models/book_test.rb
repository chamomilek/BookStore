# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :books
  test 'should not save article without title' do
    book = Book.new
    assert_not book.save
  end

  test 'book attributes must not be empty' do
    book = Book.new
    assert book.invalid?
    assert book.errors[:title].any?
    assert book.errors[:description].any?
    assert book.errors[:price].any?
    assert book.errors[:images].any?
  end

  test 'book price must be positive' do
    book = Book.new(title: 'My Book Title',
                    description: 'yyy',
                    images: 'zzz.jpg')
    book.price = -1
    assert book.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 book.errors[:price]
    book.price = 0
    assert book.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 book.errors[:price]
    book.price = 1
    assert book.invalid?
  end
end
