class User::UsersController < Clearance::UsersController

  before_action :require_login, except: [:create]
  before_action :check_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(permit_params)
      redirect_to user_path(@user)
    else
      flash[:warning] = 'Incorrect input(s)'
      render :edit
    end
  end

  private

  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    gender = user_params.delete(:gender)
    country = user_params.delete(:country)
    phone_number = user_params.delete(:phone_number)
    description = user_params.delete(:description)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.gender = gender
      user.country = country
      user.phone_number = phone_number
      user.description = description
    end
  end

  def permit_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :description,
      :country, :phone_number, :avatar)
  end

  def check_user
    unless User.find(params[:id]) == current_user
      flash[:warning] = 'Y U DO DIS'
      redirect_to '/'
    end
  end
end