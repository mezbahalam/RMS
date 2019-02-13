$(document).ready(function() {
    $("#text_input").on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});

$(document).ready(function() {
    $('#cgpa').on('keyup', function(){
        var minVal = $(this).val();
        $("#myTable tr").filter(function() {
            var rowVal = $(this).find('.cgpa-search').eq(0).text();
            if(minVal<=rowVal) {
                $(this).toggle(true);
            } else {
                $(this).toggle(false);
            }
        });
    });
});

$(document).ready(function() {
    $('#min, #max').on('keyup', function(){
        var minVal = $('#min').val();
        var maxVal = $('#max').val();
        $("#myTable tr").filter(function() {
            var rowVal = $(this).find('.filter-column').eq(0).text();
            if(minVal<=rowVal && maxVal>=rowVal) {
                $(this).toggle(true);
            } else {
                $(this).toggle(false);
            }
        });
    });
});
