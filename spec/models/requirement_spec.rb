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
  let(:my_requirement) { create(:requirement_with_duration) }

  it "is invalid without a title" do
    expect(req.valid?).to eq false
  end

  it "can not be saved without a title" do
    expect{ req.save! }.to raise_error ActiveRecord::RecordInvalid
  end

  it "prevents saving without a title" do
    expect(req.save).to eq false
  end

  it "calculates whether an evidence is applicable" do
    outcome = my_requirement.is_applicable(
      double(:evidence, created_at: DateTime.now - 6.months)
    )
    expect(outcome).to eq true
  end

  it "calculates whether an evidence is not applicable" do
    outcome = my_requirement.is_applicable(
      double(:evidence, created_at: DateTime.now - 10.months)
    )
    expect(outcome).to eq false
  end

  it "with no within_months gives always applicable" do
    outcome = req.is_applicable(
      double(:evidence, created_at: DateTime.now - 5.months)
    )
    expect(outcome).to eq true
  end

  it "evidence is still applicable when within_months matches exactly" do
    outcome = my_requirement.is_applicable(
      double(:evidence, created_at: DateTime.now - 9.months)
    )
    expect(outcome).to eq true
  end
end
