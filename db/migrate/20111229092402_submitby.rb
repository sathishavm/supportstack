class Submitby < ActiveRecord::Migration
  def up
    add_column :tickets,:submitby,:string
  end

  def down
  end
end
