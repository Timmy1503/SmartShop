var contact = {
    init: function () {
        contact.registerEvents();
    },
    registerEvents: function () {
        $('#btnSend').off('click').on('click', function () {
            event.preventDefault();
            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var phone = $('#txtPhone').val();
            var subject = $('#txtSubject').val();
            var content = $('#txtContent').val();

            $.ajax({
                url: '/Contact/Send',
                type: 'POST',
                dataType: 'json',
                data: {
                    name: name,
                    email: email,
                    phone: phone,
                    subject: subject,
                    content: content
                },
                success: function (result) {
                    if (result.status == true) {
                        window.alert('Gửi thành công');
                        contact.resetForm();
                    }
                }
            });
        });
    },

    resetForm: function () {
        name = $('#txtName').val('');
        email = $('#txtEmail').val('');
        phone = $('#txtPhone').val('');
        subject = $('#txtSubject').val('');
        content = $('#txtContent').val('');
    }
}
contact.init();