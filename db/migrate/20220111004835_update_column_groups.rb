class UpdateColumnGroups < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :owner, :user_id
  end
end
