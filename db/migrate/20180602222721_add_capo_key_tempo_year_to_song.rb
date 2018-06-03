class AddCapoKeyTempoYearToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :capo, :integer
    add_column :songs, :key, :string
    add_column :songs, :tempo, :integer
    add_column :songs, :year, :integer
  end
end
