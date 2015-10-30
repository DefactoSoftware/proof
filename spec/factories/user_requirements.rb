# == Schema Information
#
# Table name: user_requirements
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  requirement_id :integer          not null
#

FactoryGirl.define do
  factory :user_requirement do
    association :user, factory: :user
    association :requirement, factory: :requirement
  end
end
