class CreateXApiStatements < ActiveRecord::Migration
  def change
    create_table :x_api_statements do |t|
      t.string :actor
      t.string :verb
      t.string :object
      t.json :payload
      t.timestamps null: false
    end
    add_index :x_api_statements, :actor
    add_index :x_api_statements, :verb
    add_index :x_api_statements, :object
  end
end
