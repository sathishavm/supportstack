class Confirmation < ActionMailer::Base
  default :from => "sathish.subramanian@raisfactory.org"
  def send_mail(u,password,user)
  @pass=password
  @user=user
  @email=u
    mail(:to=>"<#{u}>",:subject=>"your account have been activated successfully.")
    end
end
