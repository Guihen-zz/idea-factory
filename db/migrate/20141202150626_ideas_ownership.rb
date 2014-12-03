class IdeasOwnership < ActiveRecord::Migration
  def change
  	change_table :ideas do |t|
      t.belongs_to :user
    end
  end
end
