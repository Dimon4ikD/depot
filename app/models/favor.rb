class Favor < ActiveRecord::Base


  belongs_to :product
  validates :tick, :inclusion => {:in => [true, false]}



end
