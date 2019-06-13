class UsersController < ApplicationController
  before_action :logged_in_user, :load_user, :correct_user, only: %i(show)

  def show
    if @user.patient?
      redirect_to @user.patient
    elsif @user.clinic?
      redirect_to @user.clinic
    else
      redirect_to admin_root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      if @user.clinic?
        redirect_to new_clinic_path
      else
        redirect_to new_patient_path
      end
    else
      render :new
    end
  end

  def destroy
    current_user.destroy
    log_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :role
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to current_user
  end

  def correct_user
    return if current_user?(@user)
    redirect_to current_user
  end
end
