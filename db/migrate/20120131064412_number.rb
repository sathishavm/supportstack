class Number < ActiveRecord::Migration
  def up
    add_column :transactions,:number,:string 
  end

  def down
  end
end
