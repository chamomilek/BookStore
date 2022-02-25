class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :genre, :image_url

  has_many :books
end
