module SessionsHelper
  def log_in user
	session[:user_id] = user.id
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    return unless (user_id = session[:user_id])
    @current_user ||= User.find_by id: user_id
  end

  def current_user? user
    user == current_user
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def select_major
    Major.all.map{|c| [c.name, c.id]}
  end

  def select_rating
    [
      ["*","1"],
      ["**","2"],
      ["***","3"],
      ["****","4"],
      ["*****","5"]
    ]
  end
end
