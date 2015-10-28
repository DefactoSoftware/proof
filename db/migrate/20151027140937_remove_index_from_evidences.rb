class RemoveIndexFromEvidences < ActiveRecord::Migration
  def change
    remove_index :evidences, :user_id
    remove_index :evidences, :requirement_id
  end
end
