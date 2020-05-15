class AddFilenameToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :album_image, :string
  end
end
