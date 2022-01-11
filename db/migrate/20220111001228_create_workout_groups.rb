class CreateWorkoutGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer :owner
      t.string :title
      t.integer :members, array: true, default: []
      t.string :bio
      t.boolean :public

    end
  end
end
