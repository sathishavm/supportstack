class Client < ActiveRecord::Base
belongs_to:user
validates :company,:presence => true
validates :address_1,:presence => true
validates :phone_1,:presence => true,:numericality=>true,:length => { :is => 10,        :message => " Only 10 number allowed. " }
validates :city,:presence => true
validates :state,:presence => true
end
