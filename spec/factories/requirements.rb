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

FactoryGirl.define do
  factory :requirement do
    title "Some title"
    description "Some description"

    factory :requirement_with_duration do
      within_months 9
    end
  end
end
