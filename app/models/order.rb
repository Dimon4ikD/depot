class Order < ActiveRecord::Base
  STATUSES=%w(Оформлен Подтвержден Доставляется Завершен Отменен)

  belongs_to :cart,->{includes(:line_items => :product).order(:created_at)}
  belongs_to :user

  scope :ordering, ->{order(created_at: :desc)}

  validates :cart, presence: true
  validates :user, presence: true
  validates :address, presence: true
  validates :status, presence: true,inclusion: {in:0...STATUSES.size}

  validate :check_cart
  def check_cart
    if cart && cart.line_items.blank?
      errors.add(:cart,"пуста")
    end
  end

end