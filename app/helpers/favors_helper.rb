module FavorsHelper
  #
  # def show_cart(cart)
  #   #render 'carts/cart', cart:cart
  #   text="В корзине #{cart.total_line_items} товаров на сумму #{number_to_currency(cart.total_amount)}"
  #   content_tag(:div,text,class:"alert alert-danger",id:"my_cart")
  # end
  # def upd_cart(cart)
  #   "В корзине #{cart.total_line_items} товаров на сумму #{number_to_currency(cart.total_amount)}"
  # end
  #
  #
  #
  #
  # def show_cart(cart)
  #   #render 'carts/cart', cart:cart
  #   text="#{favor.}"
  #   content_tag(:div,text,class:"alert alert-danger",id:"my_cart")
  # end
  # def upd_cart(cart)
  #   "В корзине #{cart.total_line_items} товаров на сумму #{number_to_currency(cart.total_amount)}"
  # end

  def show_favor(favor)
    #render 'favor/favor', favor:favor
    text="#{user.favor_items}"
    content_tag(:div,text,class:"alert alert-danger",id:"my_favor")
  end
  def upd_favor(favor)
    "В корзине #{favor.total_line_items} товаров на сумму #{number_to_currency(favor.total_amount)}"
  end

  def destroy
    @favor.destroy
    redirect_to root_path, notice: 'Избранные очищены.'
  end


end
