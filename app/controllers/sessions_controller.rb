class SessionsController < ApplicationController
<<<<<<< HEAD
  def new
  end

  def create
    @user=User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to root_path, notice: "Авторизация прошла успешно"
    else
      flash[:danger]="Неверный адрес эл. почты или пароль"
=======

  def create
    @user=User.where(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to root_path, notice: "Авторизация успешна"
    else
      flash[:danger]="Неверное имя пользователя или пароль"
>>>>>>> origin/master
      render :new
    end
  end

<<<<<<< HEAD

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Вы вышли!"
  end



end
=======
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Выход выполнен"
  end
end
>>>>>>> origin/master
