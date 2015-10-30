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

FactoryGirl.define do
  factory :user do
    email "some_one@somewhere.com"
    name "Some One"
    password "password"

    factory :manager do
      manager true
    end
  end
end
