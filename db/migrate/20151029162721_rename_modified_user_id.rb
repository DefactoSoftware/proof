class RenameModifiedUserId < ActiveRecord::Migration
  def change
    rename_column(:evidence_histories, :modified_user_id, :modified_by_user_id)
  end
end
