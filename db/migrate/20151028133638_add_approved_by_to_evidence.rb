class AddApprovedByToEvidence < ActiveRecord::Migration
  def change
    add_column :evidences, :approved_by_user_id, :integer
  end
end
