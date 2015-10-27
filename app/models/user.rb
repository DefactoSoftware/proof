class User < ActiveRecord::Base
  include Clearance::User
  include Gravtastic
  gravtastic
  validates :email, presence: true
end
