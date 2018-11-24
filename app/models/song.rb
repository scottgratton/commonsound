class Song < ApplicationRecord
    include SongUploader[:track]

    validates :title, presence: true
    validates :artist, presence: true
    validates :track, presence: true

    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :genre, :instruments, :mood

    belongs_to :artist
    belongs_to :album
end
