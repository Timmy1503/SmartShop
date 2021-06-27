var help = {
    init: function () {
        help.registerEvents();
    },
    registerEvents: function () {
        $('.btn-change-status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Help/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {

                    if (response.status == true) {
                        btn.text('Kích hoạt');
                        btn.removeClass('btn-danger');
                        btn.addClass("btn-success");
                    }
                    else {
                        btn.text('Khoá');
                        btn.removeClass('btn-success');
                        btn.addClass("btn-danger");
                    }
                }
            });
        });
    }
}
help.init();