class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in @user, :event => :authentication #this will throw if @user is not activated
      if @user.sign_in_count == 1
        flash[:notice] = "You have successfully signed up! Please fill-in your profile information."
        redirect_to edit_user_registration_path
      else
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        redirect_to feed_path
      end  
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end