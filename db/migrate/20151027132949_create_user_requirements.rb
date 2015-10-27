class CreateUserRequirements < ActiveRecord::Migration
  def change
    create_table :user_requirements do |t|
      t.integer :user_id, null: false
      t.integer :requirement_id, null: false
    end
    add_foreign_key :user_requirements, :users
    add_foreign_key :user_requirements, :requirements
  end
end
