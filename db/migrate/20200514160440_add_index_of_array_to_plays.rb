class AddIndexOfArrayToPlays < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :index_of_array, :integer
  end
end
