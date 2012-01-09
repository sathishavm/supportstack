class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
 t.string :subject
 t.string :description
 t.datetime :date
 t.string :place
 t.integer :user_id
      t.timestamps
    end
  end
end
