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

  private
    def new
    end

    def create(user_num)
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        if user_num == 1
          log_in_one user
        elsif user_num == 2
          log_in_two user
        end
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

    def destroy(user_num)
      if user_num == 1
        log_out_one
      elsif user_num == 2
        log_out_two
      end
      redirect_to root_url
    end
end
