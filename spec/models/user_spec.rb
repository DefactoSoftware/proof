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

require 'rails_helper'

describe User, type: :model do
  let(:user) { create(:user) }
  let(:requirements) { create_list(:requirement, 2) }

  it "has many user_requirements" do
    expect(user.user_requirements.count).to eq 0
  end

  it "can receive requirements" do
    requirements.each do |requirement|
      user.add_requirement(requirement)
    end
    expect(user.user_requirements.count).to eq 2
  end

  it "returns my requirements" do
    expect(user.requirements).to eq []
    req = create(:user_requirement, user: user).requirement
    expect(user.reload.requirements).to include req
  end

end
