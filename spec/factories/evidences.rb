# == Schema Information
#
# Table name: evidences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  requirement_id      :integer
#  valid_until         :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  description         :string
#  approved            :boolean          default(FALSE)
#  approved_by_user_id :integer
#

FactoryGirl.define do
  factory :evidence do

  end

end
