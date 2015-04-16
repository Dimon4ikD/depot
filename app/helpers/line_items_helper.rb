module LineItemsHelper


  def add_quantity
    self.quantity+=1
    self.save
  end



end