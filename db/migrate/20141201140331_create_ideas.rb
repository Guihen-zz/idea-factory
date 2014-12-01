class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :platform
      t.string :architecture
      t.string :tools
      t.string :hardware
      t.integer :effort
      t.date :deadline

      t.timestamps
    end
  end
end
