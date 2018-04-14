class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :albums_genres do |t|
      t.belongs_to :album, index: true
      t.belongs_to :genre, index: true
    end
  end
end
