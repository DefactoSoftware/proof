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

require 'rails_helper'

describe Requirement, type: :model do
  let(:req) { Requirement.new }

  it { validate_presence_of :title }

  it "is invalid without a title" do
    expect(req.valid?).to eq false
  end

  it "can not be saved without a title" do
    expect{ req.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "prevents saving without a title" do
    expect(req.save).to eq false
  end
end
