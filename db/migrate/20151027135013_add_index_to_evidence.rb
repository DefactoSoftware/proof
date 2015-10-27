class AddIndexToEvidence < ActiveRecord::Migration
  def change
    def change
      add_index :evidences, [:user_id, :requirement_id], :unique => true
    end
  end
end
