class SessionsController < ApplicationController
  def new_one
  end

  def create_one
    create(1)
  end

  def destroy_one
    destroy(1)
  end

  def new_two
  end

  def create_two
    create(2)
  end

  def destroy_two
    destroy(2)
  end

  def new_three
  end

  def create_three
    create(3)
  end

  def destroy_three
    destroy(3)
  end

  def new_four
  end

  def create_four
    create(4)
  end

  def destroy_four
    destroy(4)
  end

  private
    def new
    end

    def create(user_num)
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

    def destroy(user_num)
      if user_num == 1
        log_out_one
      elsif user_num == 2
        log_out_two
      elsif user_num == 3
        log_out_three
      elsif user_num == 4
        log_out_four
      end
      redirect_to root_url
    end
end
