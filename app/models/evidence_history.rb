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

class EvidenceHistory < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :approver, class_name: "User", foreign_key: "approved_by_user_id"
  belongs_to :modifier, class_name: "User", foreign_key: "modified_by_user_id"
  belongs_to :evidence
end
