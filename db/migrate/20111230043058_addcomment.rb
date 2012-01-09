class Addcomment < ActiveRecord::Migration
  def up
    add_column :staff_admins,:comment,:string
  end

  def down
  end
end
