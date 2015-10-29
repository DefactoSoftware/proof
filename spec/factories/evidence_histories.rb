# == Schema Information
#
# Table name: evidence_histories
#
#  id                  :integer          not null, primary key
#  evidence_id         :integer
#  approved            :boolean
#  valid_until         :datetime
#  approved_by_user_id :integer
#  modified_by_user_id :integer
#  description         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :evidence_history do
    
  end

end
