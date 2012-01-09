class Addcompanytoclient < ActiveRecord::Migration
  def up
    add_column :clients,:company,:string 
  end

  def down
  end
end
