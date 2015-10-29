class CreateEvidenceHistories < ActiveRecord::Migration
  def change
    create_table :evidence_histories do |t|
      t.belongs_to :evidence
      t.boolean :approved
      t.datetime :valid_until
      t.integer :approved_by_user_id
      t.integer :modified_user_id
      t.string :description
      t.timestamps null: false
    end
  end
end
