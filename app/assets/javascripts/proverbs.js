$(document).on('turbolinks:load', function () {
    $('.proverbSearch__form').on('keyup', function () {
        var name = $.trim($(this).val());

        $.ajax({
                type: 'GET',
                url: '/proverbs/result',
                data: {
                    name: name
                },
                datatype: 'json'
            })

            .done(function (data) {
                $('.proverbResult li').remove();

                $(data).each(function (i, result) {
                    $('.proverbResult').append(
                        `<li class="proverbResult__list"><a href="/proverbs/${result.id}">${result.name}</a></li>`
                    );
                });
            })
    });
});
