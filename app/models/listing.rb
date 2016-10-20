class Listing < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :listing_tags
  has_many :listing_tags
  has_many :booking_dates
  has_many :reservations, through: :booking_dates
    mount_uploaders :avatars, AvatarUploader
end
