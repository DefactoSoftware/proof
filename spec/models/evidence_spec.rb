# == Schema Information
#
# Table name: evidences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  requirement_id      :integer
#  valid_until         :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  description         :string
#  approved            :boolean          default(FALSE)
#  approved_by_user_id :integer
#

require 'rails_helper'

RSpec.describe Evidence, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
