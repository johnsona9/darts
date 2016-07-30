class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      if !logged_in_one?
        log_in_one user
        flash[:success] = "Account activated!"
        redirect_to user
      elsif !logged_in_two?
        log_in_two user
        flash[:success] = "Account activated!"
        redirect_to user
      else
        flash[:danger] = 'Two users are already signed in.'
        redirect_to root_url
      end
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
