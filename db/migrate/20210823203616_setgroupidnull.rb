class Setgroupidnull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :transfers, :group_id, true
  end
end
