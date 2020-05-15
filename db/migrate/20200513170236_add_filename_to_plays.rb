class AddFilenameToPlays < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :play_image, :string
  end
end
