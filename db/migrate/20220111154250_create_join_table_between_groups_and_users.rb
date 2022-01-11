class CreateJoinTableBetweenGroupsAndUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_users, :id => false do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end
end
