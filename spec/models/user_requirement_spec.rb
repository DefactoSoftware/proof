# == Schema Information
#
# Table name: user_requirements
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  requirement_id :integer          not null
#

require 'rails_helper'

describe UserRequirement, type: :model do
  let(:user_requirement) { create(:user_requirement) }

  it "belongs to a user" do
    expect(user_requirement.user).not_to eq nil
  end

  it "belongs to a requirement" do
    expect(user_requirement.requirement).not_to eq nil
  end
end
