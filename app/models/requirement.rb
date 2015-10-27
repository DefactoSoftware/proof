# == Schema Information
#
# Table name: requirements
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  description   :string
#  within_months :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Requirement < ActiveRecord::Base
  validates_presence_of :title
  has_many :evidences
  has_many :users, through: :evidences

  def has_evidence_for(user)
    return true if users.include?(user)
  end

end
