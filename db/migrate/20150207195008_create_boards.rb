class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :team, index: true

      t.timestamps
    end
  end
end
