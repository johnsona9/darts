class SessionsController < ApplicationController
  def new
    session[:login_id] = params[:id]
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        if logged_in_users.include? user.id
          flash[:danger] = 'You can not sign in more than once'
        else
          if session[:login_id].nil?
            log_in(unused_sessions[0], user) unless unused_sessions.empty?
          else
            log_in(session[:login_id].to_i, user)
            session.delete(:login_id)
          end
        end
      else
        flash[:warning] = 'Your account is not activated, please check your email and try again.'
      end
    else
      flash[:danger] = 'Invalid email/password combination'
    end
    redirect_to root_url
  end

  def destroy
    if params[:id] == '1'
      log_out_one
    elsif params[:id] == '2'
      log_out_two
    elsif params[:id] == '3'
      log_out_three
    elsif params[:id] == '4'
      log_out_four
    end
    redirect_to root_url
  end
end
