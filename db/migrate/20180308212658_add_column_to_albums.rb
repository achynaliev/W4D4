class AddColumnToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :band_id, :integer, null: true
    add_column :tracks, :album_id, :integer, null: true
  end
end
