var product = {
    init: function () {
        product.registerEvents();
    },
    registerEvents: function () {
        $('.btn-change-status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Product/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {

                    if (response.status == true) {
                        btn.text('Còn hàng');
                        btn.removeClass('btn-danger');
                        btn.addClass("btn-success");
                    }
                    else {
                        btn.text('Hết hàng');
                        btn.removeClass('btn-success');
                        btn.addClass("btn-danger");
                    }
                }
            });
        });
    }
}
product.init();