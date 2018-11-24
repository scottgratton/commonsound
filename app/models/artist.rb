class Artist < ApplicationRecord
    has_many :songs
    has_many :albums
    belongs_to :user, optional: true
    has_one_attached :image
end
