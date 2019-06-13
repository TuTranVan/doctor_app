class ClinicsController < ApplicationController
  before_action :load_clinic, only: %i(show edit update)

  def index
    @clinics = Clinic.newest
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new clinic_params
    if @clinic.save
      flash[:success] = "Bạn đã đăng ký thành công"
      redirect_to @clinic
    else
      render :new
    end
  end

  def show; end

  def edit;  
  end

  def update
    if @clinic.update_attributes clinic_params
      flash[:success] = "Bạn đã cập nhật thành công"
      redirect_to @clinic
    else
      render :edit
    end
  end

  private

  def clinic_params
    params.require(:clinic).permit :name, :phone, :address,
      :city, :introduce, :user_id
  end

  def load_clinic
    @clinic = Clinic.find_by id: params[:id]
    return if @clinic
    redirect_to current_user
  end
end
