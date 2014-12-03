class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	# t.belongs_to :idea

      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
