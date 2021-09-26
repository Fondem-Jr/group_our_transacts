class RemoveIconFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :icon, :string
  end
end
