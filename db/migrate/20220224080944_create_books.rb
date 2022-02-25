class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :images
      t.float :price
      t.integer :pages
      t.string :language
      t.float :dimensions
      t.timestamp :publication_date
      t.integer :weight
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
