class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        if logged_in_users.include? user.id
          flash[:danger] = 'You can not sign in more than once'
          redirect_to root_url
        else
          log_in(unused_sessions[0], user) unless unused_sessions.empty?
          redirect_to root_url
        end
      else
        flash[:warning] = 'Your account is not activated, please check your email and try again.'
        redirect_to root_url
      end
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to root_url
    end
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
