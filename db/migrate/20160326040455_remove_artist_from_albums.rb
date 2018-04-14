class RemoveArtistFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :artist 
  end
end
