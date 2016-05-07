class SessionsController < Clearance::SessionsController
  def create_user_from_omniauth
    auth_hash = request.env['omniauth.auth']

    authentication = Authentication.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    authentication ||= Authentication.create_with_omniauth(auth_hash)

    if (user = authentication.user)
      # found user with authentication
      authentication.update_token(auth_hash)
      @url = root_url
      flash[:success] = 'Signed In!'
    else
      # authentication no user_id
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      @url = root_url # need to be changed
      flash[:success] = "User created"
    end
    sign_in user
    redirect_to @url
  end
end