class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.string :filename
      t.text :file_url
      t.integer :timer

      t.timestamps
    end
  end
end
