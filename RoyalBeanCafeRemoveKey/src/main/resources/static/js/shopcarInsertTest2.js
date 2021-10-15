(function () {

//  var cart = { items: [], total: '' };

  //Add to cart
  var addToCart = function (product, qty) {
    qty = qty || 1;
    var cart = getCart();
    var indexOfId = cart.items.findIndex(x => x.id == product.id);

    if (indexOfId === -1) {
      cart.items.push(
        {
          id: product.id,
          name: product.name,
          price: product.price,
          picture: product.picture,
          qty: qty
        });
    } else {
      cart.items[indexOfId].qty++;
    }

    //Update popup cart
    updateCart(cart);
  }

  var getProductValues = function (element) {
    var productId = $(element).parent().parent().parent().find('.my-cart-id').attr('id');
    var productName = $(element).parent().parent().parent().find('.my-cart-name').html();
    var productPrice = $(element).parent().parent().parent().find('.my-cart-price').html();
//    var productPicture = $(element).parent().parent().find('.my-cart-picture').attr('outerHTML');
    var productPicture = $(element).parent().parent().parent().parent().parent().find('.my-cart-picture').attr('src');
	console.log(productPicture);
    return { id: productId, name: productName, price: productPrice,picture:productPicture };
  }

//  $('.card-add').on('click', function () {
//	console.log('hello');
//    var product = getProductValues(this);
//    addToCart({ id: product.id, name: product.name, price: product.price,picture:product.picture});
//  });
	//用ajax動態生成需要這種寫法
  $(document).on('click', '.card-add', function(e){
        var product = getProductValues(this);
        addToCart({ id: product.id, name: product.name, price: product.price,picture:product.picture});
      });

  //Update cart html to reflect changes
  var updateCart = function (cart) {
    var totalCost = 0;
    var totalCount = 0;

    //Add to shopping cart dropdown
    $('.cart-list').html('');
    for (var i = 0; i < cart.items.length; i++) {
      totalCost += (cart.items[i].qty * parseFloat(cart.items[i].price));
      totalCount += cart.items[i].qty;

//      $('.cart-list').append(
//        '<li class="clearfix">' +
//        '<div class="my-cart-item">' +
//        '<div><span>Name: </span>' + cart.items[i].name + '</div>' +
//        '<div><span>Price: </span>' + cart.items[i].price + '</div>' +
//        '<div>Qty: </span>' +
//        '<i id="subtract-qty' + i + '" class="fa fa-minus-square update-qty subtract-qty cart-thumb" aria-hidden="true"></i><span> ' +
//        cart.items[i].qty +
//        ' <i id="add-qty' + i + '" class="fa fa-plus-square update-qty add-qty cart-thumb" aria-hidden="true"></i></div>' +
//        '</div>' +
//        '<div class="my-cart-remove-container">' +
//        '<i id="my-cart-remove' + i + '" class="fa fa-times my-cart-remove cart-thumb" aria-hidden="true">' +
//        '</div>' +
//        '</i>'
//      );

//      $('.cart-list').append(
//        '<li class="clearfix">' +
//        '<div class="my-cart-item">' +
//        '<li><div><img src="' + cart.items[i].picture + '">' +
//		'<span><strong>'+ cart.items[i].name + '</strong></span></div>'+
//        '<div><span>Price: </span>' + cart.items[i].price + '</div></li>' +
//        '<div>Qty: </span>' +
//        '<i id="subtract-qty' + i + '" class="fa fa-minus-square update-qty subtract-qty cart-thumb" aria-hidden="true"></i><span> ' +
//        cart.items[i].qty +
//        ' <i id="add-qty' + i + '" class="fa fa-plus-square update-qty add-qty cart-thumb" aria-hidden="true"></i></div>' +
//        '</div>' +
//        '<div class="my-cart-remove-container">' +
//        '<i id="my-cart-remove' + i + '" class="fa fa-times my-cart-remove cart-thumb" aria-hidden="true">' +
//        '</div>' +
//        '</i>'
//      );
//
      $('.cart-list').append(
        '<li><a class="photo"><img class="cart-thumb" src="' + cart.items[i].picture + '"></a>' +
		'<strong><span><a>'+ cart.items[i].name + '</a></span></strong>'+'<span display="inline-block">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i id="my-cart-remove' + i + '" class="fa fa-times my-cart-remove cart-thumb" aria-hidden="true" display="inline-block"></i></span>'+
		'<p>'+cart.items[i].qty +'x- <span class="price">$'+cart.items[i].price + '</span></p>'+
        '<span display="inline-block">'+'數量: </span>' +"&nbsp&nbsp&nbsp&nbsp"+
        '<i display="inline-block" id="subtract-qty' + i + '" class="fa fa-minus-square update-qty subtract-qty cart-thumb" aria-hidden="true"></i><span> ' +"&nbsp&nbsp&nbsp&nbsp"+
        cart.items[i].qty +"&nbsp&nbsp&nbsp&nbsp"+
        ' <i display="inline-block" id="add-qty' + i + '" class="fa fa-plus-square update-qty add-qty cart-thumb" aria-hidden="true"></i>' 
      );

      (function () {
        var currentIndex = i;
        $('#add-qty' + currentIndex).on('click', function () {
          updateQuantity(cart.items[currentIndex].id, ++cart.items[currentIndex].qty);
        })
      })();

      (function () {
        var currentIndex = i;
        $('#subtract-qty' + currentIndex).on('click', function () {
          if (cart.items[currentIndex].qty != 1) {
            updateQuantity(cart.items[currentIndex].id, --cart.items[currentIndex].qty);
          }
        });
      })();

      (function () {
        var currentIndex = i;
        $('#my-cart-remove' + currentIndex).on('click', function () {
          removeFromCart(cart.items[currentIndex].id);
        });
      })();
    }
    //Update Counter
    updateCounter(totalCount);

    //Update Total
    updateTotal(totalCost);

    localStorage.setItem('CartItem', JSON.stringify(cart));	
  }

  //Update cart quantity by id
  var updateQuantity = function (id, qty) {
    var cart = getCart();
    var cartIndex = cart.items.findIndex(x => x.id == id);
    cart.items[cartIndex].qty = qty;
    //Update popup cart
    updateCart(cart);
  };

  //Remove from cart on id
  var removeFromCart = function (id) {
    var cart = getCart();
    var cartIndex = cart.items.findIndex(x => x.id == id);

    cart.items.splice(cartIndex, 1);
    //Update popup cart
    updateCart(cart);
  };

  //Get Cart
  var getCart = function () {
    var myCart = cart;
    return myCart;
  }

  //Update counter 
  var updateCounter = function (val) {
    $('.my-cart-counter').html(val);
  }

  //Update total
  var updateTotal = function (val) {
	var cart = getCart();
	cart.total = val;
    $('.my-cart-total').html(val);
  }

  //Checkout to sandbox payment gateway
  var checkout = function () {
    var cart = getCart();
    if (cart.items.length > 0) {
      alert("checkout!");
	  console.log(cart);
	  localStorage.setItem('Cart', JSON.stringify(cart));
	  location.href="shoppaypage"
    } else {
      alert("請選擇商品");
    }
  };

  //Listeners
  //Close popup on body click
//  $('body').click(function (e) {
//    e.preventDefault();
//    $(".shopping-cart").fadeOut("fast");
//  });

  $(document).on('click', 'body', function(e){
 	    e.preventDefault();
    $(".shopping-cart").fadeOut("fast");
      });


  //Toggle cart on icon click
  $(".my-cart-icon").on("click", function (e) {
    e.stopPropagation();
    $(".shopping-cart").fadeToggle("fast");
  });

  //Prevent close on popup click
  $('.my-cart-popup').on('click', function (e) {
    e.stopPropagation();
  });

  //Prevent close on popup click
  $('.my-cart-checkout').on('click', function (e) {
    checkout();
    e.stopPropagation();
  });
  //Prevent close on popup click
//  $('.pdview').on('click', function (e) {
//    e.stopPropagation();
//  });
//  //Prevent close on popup click
  $(document).on('click', '.pdview', function(e){
 	e.stopPropagation();
      });

  $(document).on('click', '.venderAllName', function(e){
 	e.stopPropagation();
      });

  $(document).on('click', '.venderSearchAll', function(e){
 	e.stopPropagation();
      });

  //取消預設屬性透過ajax做跳轉
  $(document).on('click', '.selectcompanypd', function(e){
 	e.preventDefault();
      });

  $(document).on('click', '.pdview', function(e){
 	e.stopPropagation();
      });

  $(document).on('click', '.shoppd', function(e){
 	e.stopPropagation();
      });

  $(document).on('click', '.logout', function(e){
 	e.stopPropagation();
      });

})();