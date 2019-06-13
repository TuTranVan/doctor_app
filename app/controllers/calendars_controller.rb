class CalendarsController < ApplicationController
  before_action :load_calendar, only: %i(show finish destroy)

  def create
    @calendar = Calendar.new calendar_params
    if @calendar.save
      flash[:success] = "Đặt lịch thành công"
    else
      flash[:danger] = "Phải nhập đầy đủ thông tin"
    end
    redirect_to @calendar.patient
  end

  def destroy
    if @calendar.destroy
      flash[:success] = "Bạn đã hủy thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to @calendar.patient
  end

  def show;    
  end

  def finish
    @calendar.update_attributes status: 1, result: params[:finish][:result], cost: params[:finish][:cost]
    flash[:success] = "Hoàn tất khám bệnh"
    redirect_to @calendar
  end

  private

  def calendar_params
    params.require(:calendar).permit :clinic_id, :patient_id, :date, :time
  end

  def load_calendar
    @calendar = Calendar.find_by id: params[:id]
    return if @calendar
    redirect_to @calendar.clinic
  end
end
