class PhysiciansController < ApplicationController
  before_action :load_physician, only: %i(edit update)

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new physician_params
    if @physician.save
      flash[:success] = "Thêm bác sĩ thành công"
      redirect_to @physician.clinic
    else
      render :new
    end
  end

  def edit;  
  end

  def update
    if @physician.update_attributes physician_params
      flash[:success] = "Bạn đã cập nhật thành công"
      redirect_to @physician.clinic
    else
      render :edit
    end
  end

  private

  def physician_params
    params.require(:physician).permit :name, :gender, :dob,
      :email, :phone, :major_id, :clinic_id
  end

  def load_physician
    @physician = Physician.find_by id: params[:id]
    return if @physician
    redirect_to current_user
  end
end
