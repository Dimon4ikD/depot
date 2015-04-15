class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  before_action :set_locale
  before_action :set_cart_
  before_action :set_current_user

  protect_from_forgery with: :exception
<<<<<<< HEAD
=======
  before_action :set_cart
  before_action :set_current_user
>>>>>>> origin/master

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

<<<<<<< HEAD
  def record_not_found
    render plain:"404 Not Found", status: 404
  end

  def set_cart_
=======

  def set_cart
>>>>>>> origin/master
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def set_current_user
<<<<<<< HEAD
    if session[:user_id].present?
=======
    if session[:user.id].present?
>>>>>>> origin/master
      @current_user=User.find(session[:user_id])
    end
  end

  def require_login
<<<<<<< HEAD
    if !@curent_user
=======
    if !@current_user
>>>>>>> origin/master
      flash[:danger]="Требуется авторизация"
      redirect_to login_path
    end
  end

  def manager_permission
<<<<<<< HEAD
    unless @curent_user.try(:manager?)
=======
    unless @current_user.try(:manager?)
>>>>>>> origin/master
      flash[:danger]="Недостаточно прав"
      redirect_to login_path
    end
  end

  def admin_permission
<<<<<<< HEAD
    unless @curent_user.try(:admin?)
=======
    unless @current_user.try(:admin?)
>>>>>>> origin/master
      flash[:danger]="Недостаточно прав"
      redirect_to login_path
    end
  end

<<<<<<< HEAD

=======
>>>>>>> origin/master
end