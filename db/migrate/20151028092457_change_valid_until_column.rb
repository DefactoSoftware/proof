class ChangeValidUntilColumn < ActiveRecord::Migration
  def change
    change_column_null(:evidences, :valid_until, true)
  end
end
