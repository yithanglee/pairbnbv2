class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :tags, through: :listing_tags
  has_many :listing_tags
    mount_uploaders :avatars, AvatarUploader

    searchkick match: :word_start, searchable: [:title, :location]
end
