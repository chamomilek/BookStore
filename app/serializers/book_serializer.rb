# frozen_string_literal: true

class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :images, :price, :pages, :language, :dimensions, :publication_date, :weight,
             :category_id
end
