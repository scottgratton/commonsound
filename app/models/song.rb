class Song < ApplicationRecord
    include SongUploader[:track]

    validates :title, presence: true
    validates :artist, presence: true
    validates :track, presence: true
end
