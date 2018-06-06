class Song < ApplicationRecord
  belongs_to :artist

  validates :title, presence: true
  validates :body, presence: true
  validates :artist, presence: true
end
