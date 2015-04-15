$('#my_cart').html("<%= escape_javascript upd_cart(@cart) %>");

$(document).trigger "cart:update"
alert "Товар << <%=j @product.name%> >> добавлен в корзину."