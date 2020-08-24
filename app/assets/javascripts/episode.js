$(document).on('turbolinks:load', function () {
    $('.js-text_field').on('keyup', function () {
        var title = $.trim($(this).val());

        $.ajax({
                type: 'GET',
                url: '/episodes/result',
                data: {
                    title: title
                },
                datatype: 'json'
            })

            .done(function (data) {
                $('.js-results li').remove();

                $(data).each(function (i, result) {
                    $('.js-results').append(
                        `<li class="result"><a href="/episodes/${result.id}">${result.title}</a></li>`
                    );
                });
            })
    });
});