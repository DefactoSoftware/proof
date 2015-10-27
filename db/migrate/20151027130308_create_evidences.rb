class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.belongs_to :user, index: true
      t.belongs_to :requirement, index: true
      t.datetime :valid_until, null: false
      t.timestamps null: false
    end
  end
end
