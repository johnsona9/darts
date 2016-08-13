module SessionsHelper

  def logged_in_users
    currently_logged = []
    currently_logged += session[:user_id_one] unless session[:user_id_one].nil?
    currently_logged += session[:user_id_two] unless session[:user_id_two].nil?
    currently_logged += session[:user_id_three] unless session[:user_id_three].nil?
    currently_logged += session[:user_id_four] unless session[:user_id_four].nil?
  end

  def unused_sessions
    unused_logs = []
    unused_logs += 'user_id_one' if session[:user_id_one].nil?
    unused_logs += 'user_id_two' if session[:user_id_two].nil?
    unused_logs += 'user_id_three' if session[:user_id_three].nil?
    unused_logs += 'user_id_four' if session[:user_id_four].nil?
  end

  def log_in(session_id, user)
    if session_id == 1
      session[:user_id_one] = user.id
      redirect_to user
    elsif session_id == 2
      session[:user_id_two] = user.id
      redirect_to user
    elsif session_id == 3
      session[:user_id_three] = user.id
      redirect_to user
    elsif session_id == 4
      session[:user_id_four] = user.id
      redirect_to user
    end
  end

  def log_in_one(user)
    session[:user_id_one] = user.id
    redirect_to user
  end

  def log_in_two(user)
    session[:user_id_two] = user.id
    redirect_to user
  end

  def log_in_three(user)
    session[:user_id_three] = user.id
    redirect_to user
  end

  def log_in_four(user)
    session[:user_id_four] = user.id
    redirect_to user
  end

  def current_user_one
    @current_user_one ||= User.find_by(id: session[:user_id_one])
  end

  def current_user_two
    @current_user_two ||= User.find_by(id: session[:user_id_two])
  end

  def current_user_three
    @current_user_three ||= User.find_by(id: session[:user_id_three])
  end

  def current_user_four
    @current_user_four ||= User.find_by(id: session[:user_id_four])
  end

  def logged_in_one?
    !current_user_one.nil?
  end

  def logged_in_two?
    !current_user_two.nil?
  end

  def logged_in_three?
    !current_user_three.nil?
  end

  def logged_in_four?
    !current_user_four.nil?
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

  def authenticated_three?
    if logged_in_three?
      current_user_three.activated?
    else
      false
    end
  end

  def authenticated_four?
    if logged_in_four?
      current_user_four.activated?
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

  def log_out_three
    session.delete(:user_id_three)
    @current_user_three = nil
  end

  def log_out_four
    session.delete(:user_id_four)
    @current_user_four = nil
  end
end
