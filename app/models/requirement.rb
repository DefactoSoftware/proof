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
end
