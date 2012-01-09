class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
  t.integer :user_id
	t.integer :department_id
	t.string  :description
	t.string  :priority
	t.string  :status
	t.string  :category
	t.string  :subject
      t.timestamps
    end
  end
end
