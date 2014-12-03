class AddIdeaToProject < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
      t.belongs_to :idea
    end
  end
end
