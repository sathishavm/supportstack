class Transaction < ActiveRecord::Base
	belongs_to :user
attr_accessible :type,:number, :month, :amount, :year, :last_name, :verification_value, :first_name
TYPE=
{
:visa=>"VISA",
:mastercard=>"MASTER CARD",
:americanexpress=>"AMERICAN EXPRESS"
}
end
