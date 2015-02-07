class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :number, default: 0, null: false
      t.references :board, index: true

      t.timestamps
    end
  end
end
