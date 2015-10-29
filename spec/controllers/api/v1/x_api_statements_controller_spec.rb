require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Statement" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"

  post "/api/v1/statements" do
    let(:raw_post) { { x_api_statement: payload }.to_json }

    example_request "accepts a valid statement" do
      expect(status).to eq 200
    end

    example_request "creates a new statement" do
      expect(XApiStatement.count).to eq 1
    end
  end

  post "/api/v1/statements" do
    let(:raw_post) { { x_api_statement: { } } }

    example_request "handles invalid requests" do
      expect(status).to eq 422
    end
  end

  private

  def payload
    {
      actor: {
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
