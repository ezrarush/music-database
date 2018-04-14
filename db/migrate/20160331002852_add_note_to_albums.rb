class AddNoteToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :note, :text
  end
end
