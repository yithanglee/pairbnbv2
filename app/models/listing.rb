class Listing < ApplicationRecord
  belongs_to :user
      # mount_uploader :avatar, AvatarUploader
    mount_uploaders :avatars, AvatarUploader
end
