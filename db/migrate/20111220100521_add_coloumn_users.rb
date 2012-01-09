class AddColoumnUsers < ActiveRecord::Migration
  def up
   add_column :users,:fullname,:string 
   add_column :users,:phone,:string 
   add_column :users,:mobile,:string 
   
  end

  def down
  end
end
