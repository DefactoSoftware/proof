class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :title, null: false
      t.string :description, null: true
      t.integer :within_months, null: true
      t.timestamps null: false
    end
  end
end
