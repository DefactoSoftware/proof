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

require 'rails_helper'

describe XApiStatement, type: :model do

  it "can be created with a valid payload" do
    expect{
      XApiStatement.create payload: payload
    }.to change(XApiStatement, :count).by +1
  end

  it "validates the json payload" do
    payload_without_actor = payload
    payload_without_actor.delete :actor

    expect(
      XApiStatement.new(payload: payload_without_actor).valid?
    ).to eq false
  end

  it "parses attributes from payload" do
    stat = XApiStatement.create payload: payload
    expect(stat.actor).to eq payload[:actor][:mbox]
    expect(stat.verb).to eq payload[:verb][:id]
    expect(stat.object).to eq payload[:object][:id]
  end

  it "returns the statement for pretty printing" do
    stat = XApiStatement.create payload: payload
    expect(stat.statement).
      to eq("m.jacobs@defacto.nl completed Design for Developers")
  end


  def payload
    {
      "id": "a112a51b-b5cf-4b07-ab8d-b6f06138ba2a",
      "actor": {
          "mbox": "mailto:m.jacobs@defacto.nl",
          "objectType": "Agent"
      },
      "verb": {
          "id": "http://adlnet.gov/expapi/verbs/completed",
          "display": {
              "en-US": "completed"
          }
      },
      "timestamp": "2015-08-19T21:08:02.937Z",
      "stored": "2015-08-19T21:08:02.937Z",
      "authority": {
          "name": "LearningSpaces.dev",
          "account": {
              "homePage": "http://cloud.scorm.com/",
              "name": "m7NpgzjUfr-Y-G-pcU8"
          },
          "objectType": "Agent"
      },
      "version": "1.0.1",
      "object": {
          "id": "http://defacto.learning.dev/LearningSpace/25",
          "definition": {
              "name": {
                  "en-US": "Design for Developers"
              },
              "description": {
                  "en-US": "LearningSpace"
              },
              "type": "http://learningspaces.io/xapi/v1/activities/LearningSpace"
          },
          "objectType": "Activity"
      }
    }
  end
end
