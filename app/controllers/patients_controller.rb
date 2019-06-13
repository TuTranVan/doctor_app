class PatientsController < ApplicationController
  before_action :load_patient, only: %i(show edit update)

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    if @patient.save
      flash[:success] = "Bạn đã đăng ký thành công"
      redirect_to @patient
    else
      render :new
    end
  end

  def show; end

  def edit;  
  end

  def update
    if @patient.update_attributes patient_params
      flash[:success] = "Bạn đã cập nhật thành công"
      redirect_to @patient
    else
      render :edit
    end
  end

  private

  def patient_params
    params.require(:patient).permit :name, :gender, :dob,
      :address, :phone, :user_id
  end

  def load_patient
    @patient = Patient.find_by id: params[:id]
    return if @patient
    redirect_to current_user
  end
end
