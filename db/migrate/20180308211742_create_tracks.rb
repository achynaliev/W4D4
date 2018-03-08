class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: true
      t.integer :ord, null: true
      t.text :lyrics
      t.boolean :bonus, default: false
    end
  end
end
