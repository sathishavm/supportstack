class Submitedby < ActiveRecord::Migration
  def up
    add_column :tickets,:submitedby,:integer
  end

  def down
  end
end
