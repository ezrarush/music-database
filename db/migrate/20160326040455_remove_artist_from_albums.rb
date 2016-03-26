class RemoveArtistFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :artist 
  end
end
