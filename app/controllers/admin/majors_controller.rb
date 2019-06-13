class Admin::MajorsController < AdminController
  before_action :load_major, only: %i(edit update destroy)

  def index
    @majors = Major.all
  end

  def new
    @major = Major.new
  end

  def create
    @major = Major.new major_params
    if @major.save
      flash[:success] = "Chuyên khoa mới đã được thêm"
      redirect_to admin_majors_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @major.update_attributes major_params
      flash[:success] = "Bạn đã cập nhật thành công"
      redirect_to admin_majors_path
    else
      render :edit
    end
  end

  def destroy
    if @major.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to admin_majors_path
  end

  private

  def major_params
    params.require(:major).permit :name
  end

  def load_major
    @major = Major.find_by id: params[:id]
    return if @major
    redirect_to admin_majors_path
  end
end
