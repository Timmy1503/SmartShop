var cart = {
    init: function () {
        cart.registerEvents();
    },
    registerEvents: function () {
        $('#btnUpdate').off('click').on('click', function (e) {
            e.preventDefault();
            var list = $('.txtQuantity');
            var cartList = [];
            $.each(list, function (i, item) {
                cartList.push({
                    Quantity: $(item).val(),
                    Product: {
                        ProductID: $(item).data('id');
                    }
                });
            });
            $.ajax({
                url: '/Cart/Update',
                type: 'POST',
                dataType: 'JSON',
                data: { cartModel: JSON.stringify(cartList) },
                success: function (result) {
                    if (result.status == true) {
                        window.location.href = '/gio-hang';
                    }
                }
            });
        });
    }
}
cart.init();