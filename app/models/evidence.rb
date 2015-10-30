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

class Evidence < ActiveRecord::Base
  belongs_to :user
  belongs_to :requirement
  belongs_to :approver, class_name: "User", foreign_key: "approved_by_user_id"
  has_many :evidence_histories

  def expired?
    valid_until.past?
  end
end
