class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  before_action :set_locale
  before_action :set_cart_
  before_action :set_current_user
  before_action :set_favor

  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def record_not_found
    render plain:"404 Not Found", status: 404
  end

  def set_cart_
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def set_favor
    @favor = Favor.find(session[:favor_id])
  rescue ActiveRecord::RecordNotFound
    @favor = Favor.create
    session[:favor_id] = @favor.id
  end

  def set_current_user
    if session[:user_id].present?
      @current_user=User.find(session[:user_id])
    end
  end

  def require_login
    if !@curent_user
      flash[:danger]="Требуется авторизация"
      redirect_to login_path
    end
  end

  def manager_permission
    unless @curent_user.try(:manager?)
      flash[:danger]="Недостаточно прав"
      redirect_to login_path
    end
  end

  def admin_permission
    unless @curent_user.try(:admin?)
      flash[:danger]="Недостаточно прав"
      redirect_to login_path
    end
  end


end