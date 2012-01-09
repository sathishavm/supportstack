class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
  t.integer:user_id
	t.string :address_1
	t.string :address_2
	t.string :city
	t.string :state
	t.string :country
	t.string :phone_1
	t.string :phone_2
	t.string :fax
      t.timestamps
    end
  end
end
