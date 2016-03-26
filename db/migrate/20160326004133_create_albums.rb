class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :condition
      t.string :type

      t.timestamps null: false
    end
  end
end
