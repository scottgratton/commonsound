class Album < ApplicationRecord
    belongs_to :artist
    has_many :songs
    has_one_attached :image
end
