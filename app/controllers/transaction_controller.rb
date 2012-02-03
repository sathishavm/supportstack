class TransactionController < ApplicationController
		before_filter :authenticate_user!
	before_filter :verify_admin
	layout "admin"
	def new
		transactions=Transaction.new
		end
	def create
		
@pay=Transaction.new(params[:transactions]) 
@pay.user_id=current_user.id
ActiveMerchant::Billing::Base.mode = :test
gateway = ActiveMerchant::Billing::PaypalGateway.new(
:login => "sathis_1327994676_biz_api1.railsfactory.org",
:password => "1327994731",
:signature => "An5ns1Kso7MWUdW4ErQKJJJ4qi4-AaHuLHWQ7kH8MiwAWn5Q64P41aZC"
)
credit_card = ActiveMerchant::Billing::CreditCard.new(
:type => "#{params[:transactions][:type]}",
:number => "#{params[:transactions][:number]}",
:verification_value => "#{params[:transactions][:verification_value]}",
:month => "#{Date.today.month}",
:year =>"#{Date.today.year}",
:first_name => "#{params[:transactions][:first_name]}",
:last_name => "#{params[:transactions][:last_name]}"

)

@amount="#{params[:transactions][:amount]}"
if credit_card.valid?
response = gateway.purchase(@amount.to_i,credit_card,:ip => "127.0.0.1", :billing_address => {
:name => "sathish",
:address1 => "491 salem cuddalore main road attur",
:city => "salem",
:state => "Tamilnadu",
:country => "India",
:zip => "600032"
} ) 
if response.success?
puts "Purchase complete!"
@pay.status=1
flash[:notice]="successfully transfered"
@pay.save
redirect_to "/staff_admin/new"
else
puts "Error: #{response.message}"
flash[:notice]="Transaction could not be loaded please try after some time"
redirect_to :action=>"alert"
@pay.status=0
end
else
flash[:notice]="Invalid account"
puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
@pay.status=0
redirect_to "/staff_admin/dashboard"
end

end
		def verify_admin
		unless (current_user.role.name=="admin")
		   	redirect_to"/user/home"
					end
			end
end
