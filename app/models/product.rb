class Product < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 200}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :weight, numericality: {only_integer: true, greater_than: 0}, allow_blank: true
  has_many :line_items, dependent: :nullify

  before_destroy :can_destroy?

  def can_destroy?
      line_items.blank?
  end


end
