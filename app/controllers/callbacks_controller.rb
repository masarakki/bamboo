class CallbacksController < Devise::OmniauthCallbacksController
  def twitter
    user = User.from_auth(request.env['omniauth.auth'])
    sign_in_and_redirect user
  end
end
