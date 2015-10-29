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

require 'rails_helper'

RSpec.describe EvidenceHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
