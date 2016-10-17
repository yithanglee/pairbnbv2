class User < ApplicationRecord
  has_many :listings
  include Clearance::User
end
