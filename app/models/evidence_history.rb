class EvidenceHistory < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :approver, class_name: "User", foreign_key: "approved_by_user_id"
  belongs_to :modifier, class_name: "User", foreign_key: "modified_user_id"
  belongs_to :evidence
end
