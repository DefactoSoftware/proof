# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string           not null
#  encrypted_password   :string           default(""), not null
#  confirmation_token   :string
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  name                 :string
#  manager              :boolean          default(FALSE)
#  remember_token       :string(128)
#

class User < ActiveRecord::Base
  include Clearance::User
  include Gravtastic
  gravtastic

  validates :email, presence: true
  validates :name, presence: true

  has_many :evidences
  has_many :user_requirements

  def add_requirement(requirement)
    UserRequirement.create(user: self, requirement: requirement)
  end

  def requirements
    user_requirements.map(&:requirement)
  end
end
