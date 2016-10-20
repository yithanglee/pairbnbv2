class User < ApplicationRecord
  has_many :listings
  has_many :reservations
  include Clearance::User
    mount_uploader :avatar, AvatarUploader
    mount_uploaders :avatars, AvatarUploader
  # mount_uploaders :avatars, AvatarUploader
end
