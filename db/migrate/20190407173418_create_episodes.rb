class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :episode_name, null: false, default: ""
      t.text :description
      t.integer :episode_number
      t.timestamps
      t.string :spotify_link
      t.string :soundcloud_link
      t.string :itunes_link
    end
  end
end
