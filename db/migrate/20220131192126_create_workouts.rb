class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.integer :components
      t.string :type
      t.integer :group_id
      t.timestamps
    end
  end
end
