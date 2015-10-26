class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  validates :email, presence: true
end
