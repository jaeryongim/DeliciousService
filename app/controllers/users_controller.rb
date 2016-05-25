class UsersController < ApplicationController
  def signup
  end

  def signup_complete
    user = User.new
    user.username = params[:username]
    if params[:password] == params[:password_confirm]
      user.password = params[:password]
      if user.save
        flash[:alert] = '성공적으로 가입되었습니다.'
        redirect_to '/'
      else
        flash[:alert] = user.errors.values.flatten.join(' ')
        redirect_to :back
      end
    else
      flash[:alert] = '비밀번호가 맞지 않습니다.'
      redirect_to :back
    end

  end

  def login
  end

  def login_complete
    user = User.where(username: params[:username]).first
    if user.nil?
      flash[:alert] = '아이디 또는 비밀번호를 잘못 입력하셨습니다.'
      redirect_to :back
    elsif user.password != params[:password]
      flash[:alert] = '아이디 또는 비밀번호를 잘못 입력하셨습니다.'
      redirect_to :back
    else
      session[:user_id] = user.id
      flash[:alert] = '성공적으로 로그인하셨습니다.'
      redirect_to '/'
    end
  end

  def logout_complete
    reset_session   # session 해쉬 삭제
    flash[:alert] = '성공적으로 로그아웃하였습니다.'
    redirect_to '/'
  end
  
end
