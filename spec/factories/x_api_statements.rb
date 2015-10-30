# == Schema Information
#
# Table name: x_api_statements
#
#  id         :integer          not null, primary key
#  actor      :string
#  verb       :string
#  object     :string
#  payload    :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :x_api_statement do
    
  end

end
