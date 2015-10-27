# == Schema Information
#
# Table name: user_requirements
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  requirement_id :integer          not null
#

class UserRequirement < ActiveRecord::Base
  belongs_to :user
  belongs_to :requirement
end
