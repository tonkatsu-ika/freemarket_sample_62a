# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout 'users'
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end


  private
 
  def callback_for(provider)
    provider = provider.to_s
    @user = User.find_oauth(request.env['omniauth.auth'])
    unless @user.uid
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      render template: "/users/sign_in" 
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      binding.pry
      # redirect_to registlation_signup_index_path(@user)
      render template: registlation_signup_index_path(@user)
    end
  end
  
end
