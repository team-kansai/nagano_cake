class Public::RegistrationsController < Devise::RegistrationsController
  
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end 
  
  def new
  end

  def create
  end
  

end