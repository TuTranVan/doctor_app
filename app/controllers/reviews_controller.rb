class ReviewsController < ApplicationController
  before_action :load_review, only: %i(destroy)

  def create
    @review = Review.new review_params
    if @review.save
      flash[:success] = "Đánh giá thành công"
    else
      flash[:danger] = "Mời nhập nội dung đánh giá"
    end
    redirect_to @review.clinic
  end

  def destroy
    if @review.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to @review.clinic
  end

  private

  def review_params
    params.require(:review).permit :clinic_id, :patient_id, :content, :score
  end

  def load_review
    @review = Review.find_by id: params[:id]
    return if @review
    redirect_to @review.clinic
  end
end