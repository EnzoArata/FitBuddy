class ChangeInvitesColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :invites, :recipient_id, :user_id
  end
end
