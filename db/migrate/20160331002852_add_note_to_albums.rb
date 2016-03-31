class AddNoteToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :note, :text
  end
end
