$( document ).on('turbolinks:load', function () {
    $('#myfile').change(function (e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        if (file.type.indexOf("image") < 0) {
            alert("画像ファイルを指定してください");
            return false;
        }

        reader.onload = (function (file) {
            return function (e) {
                $("#image").attr("src", e.target.result);
                $("#image").attr("title", file.name);
            };
        })(file);
        reader.readAsDataURL(file);
    });
});
