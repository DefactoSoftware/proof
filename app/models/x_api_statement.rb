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

class XApiStatement < ActiveRecord::Base
  before_validation :payload_xapi_valid?
  before_create :parse_attributes_from_payload

  def statement
    "#{actor_email} #{verb_description} #{object_name}"
  end

  private

  def actor_email
    actor.gsub /mailto:/, ''
  end

  def verb_description
    payload["verb"]["display"].values.first
  end

  def object_name
    payload["object"]["definition"]["name"].values.first
  end

  def payload_xapi_valid?
    Set["actor", "verb", "object"].subset? payload.keys.to_set
  end

  def parse_attributes_from_payload
    self.actor = payload["actor"]["mbox"]
    self.verb = payload["verb"]["id"]
    self.object = payload["object"]["id"]
  end
end
