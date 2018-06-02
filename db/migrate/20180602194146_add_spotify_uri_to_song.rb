class AddSpotifyUriToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :spotify_uri, :string
  end
end
