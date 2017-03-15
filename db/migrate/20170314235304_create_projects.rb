class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :goal_in_cents
      t.integer :progress_in_cents
      t.timestamps
    end
  end
end
