class Devise::LoginzaSessionsController < Devise::SessionsController
  def loginza
    if signed_in?(resource_name)
      redirect_to after_sign_in_path_for(resource_name)
    else
      redirect_to root_url
    end
  end

end
