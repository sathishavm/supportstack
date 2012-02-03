class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
t.string :first_name
t.string :last_name
t.date :month
t.date :year
t.integer :verification_value
t.string :type
t.float :amount
t.boolean :status
t.integer :user_id
      t.timestamps
    end
  end
end
