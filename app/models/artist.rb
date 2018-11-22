class Artist < ApplicationRecord
    has_many :songs
    belongs_to :user, optional: true
    has_one_attached :image
end
