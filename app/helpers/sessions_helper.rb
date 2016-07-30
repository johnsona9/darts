module SessionsHelper

  def log_in_one(user)
    session[:user_id_one] = user.id
    redirect_to user
  end

  def log_in_two(user)
    session[:user_id_two] = user.id
    redirect_to user
  end

  def current_user_one
    @current_user_one ||= User.find_by(id: session[:user_id_one])
  end

  def current_user_two
    @current_user_two ||= User.find_by(id: session[:user_id_two])
  end

  def logged_in_one?
    !current_user_one.nil?
  end

  def logged_in_two?
    !current_user_two.nil?
  end

  def authenticated_one?
    if logged_in_one?
      current_user_one.activated?
    else
      false
    end
  end

  def authenticated_two?
    if logged_in_two?
      current_user_two.activated?
    else
      false
    end
  end

  def log_out_one
    session.delete(:user_id_one)
    @current_user_one = nil
  end

  def log_out_two
    session.delete(:user_id_two)
    @current_user_two = nil
  end
end
