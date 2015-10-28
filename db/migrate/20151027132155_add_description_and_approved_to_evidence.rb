class AddDescriptionAndApprovedToEvidence < ActiveRecord::Migration
  def change
    add_column :evidences, :description, :string
    add_column :evidences, :approved, :boolean, default: false
  end
end
