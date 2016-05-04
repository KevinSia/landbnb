class UsersController < Clearance::UsersController

  private

  def user_from_params
    user_params = params[:user] || Hash.new
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    gender = user_params.delete(:gender)
    description = user_params.delete(:description)
    phone_number = user_params.delete(:phone_number)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.password = password
      user.gender = gender
      user.description = description
      user.phone_number = phone_number
    end
  end

  def permit_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :description,
                                 :phone_number)
  end
end