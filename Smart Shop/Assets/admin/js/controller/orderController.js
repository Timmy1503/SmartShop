var order = {
    init: function () {
        order.registerEvents();
    },
    registerEvents: function () {
        $('.btn-change-status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Order/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {

                    if (response.status == true) {
                        btn.text('Đã xác nhận');
                        btn.removeClass('btn-danger');
                        btn.addClass("btn-success");
                    }
                    else {
                        btn.text('Chờ xác nhận');
                        btn.removeClass('btn-success');
                        btn.addClass("btn-danger");
                    }
                }
            });
        });
    }
}
order.init();