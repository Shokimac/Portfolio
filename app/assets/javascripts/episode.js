$(document).on('turbolinks:load', function () {
    $('.episodeSearch__form').on('keyup', function () {
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
                $('.episodeResult li').remove();

                $(data).each(function (i, result) {
                    $('.episodeResult').append(
                        `<li class="episodeResult__list"><a href="/episodes/${result.id}">${result.title}</a></li>`
                    );
                });
            })
    });
});