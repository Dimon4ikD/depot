class Product < ActiveRecord::Base
  has_attached_file :image,styles:{medium: "300x300", thumb: "100x100"}
  has_many :line_items, dependent: :nullify
  before_destroy :can_destroy?

  validates_attachment :image, content_type: {content_type:/\Aimage\//}
  validates :name, presence: true, length: {maximum: 200}
  validates :price, presence: true, numericality:{greater_than: 0}
  validates :weight, numericality:{only_integer: true, greater_than: 0}, allow_blank: true

  def can_destroy?
    line_items.blank?
  end


end