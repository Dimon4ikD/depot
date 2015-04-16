module ProductsHelper

  def in_favor
    self.tick=true
    self.save
  end
end
