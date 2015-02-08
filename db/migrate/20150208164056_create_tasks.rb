class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :sprint, index: true
      t.references :user, index: true
      t.string :title
      t.text :description
      t.integer :estimate
      t.integer :remaining_time
      t.integer :logged_time, default: 0

      t.timestamps
    end
  end
end
