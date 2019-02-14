$(document).ready(function() {
    $("#text_input").on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $('#cgpa').on('keyup', function(){
        var minVal = $(this).val();
        $("#myTable tr").filter(function() {
            var rowVal = $(this).find('.cgpa-search').eq(0).text();
            if(minVal<=rowVal && 4>=rowVal) {
                $(this).toggle(true);
            } else {
                $(this).toggle(false);
            }
        });
    });


    $('#min, #max').on('keyup', function(){
        var minVal = parseFloat($('#min').val());
        var maxVal = parseFloat($('#max').val());
        $("#myTable tr").filter(function() {
            var rowVal = $(this).find('.filter-column-exp').eq(0).text();
            if((minVal<=rowVal && maxVal>=rowVal)||
                (isNaN(minVal)&&maxVal>=rowVal) ||
                ((minVal<=rowVal&&isNaN(maxVal))) ||
                (isNaN(minVal)&&isNaN(maxVal))) {
                $(this).toggle(true);
            } else {
                $(this).toggle(false);
            }
        });
    });

    $('#min-salary, #max-salary').on('keyup', function(){
        var minVal = parseInt($('#min-salary').val());
        var maxVal = parseInt($('#max-salary').val());
        $("#myTable tr").filter(function() {
            var rowVal = $(this).find('.filter-column-salary').eq(0).text();
            if((minVal<=rowVal && maxVal>=rowVal)||
                (isNaN(minVal)&&maxVal>=rowVal) ||
                ((minVal<=rowVal&&isNaN(maxVal))) ||
                (isNaN(minVal)&&isNaN(maxVal))) {
                $(this).toggle(true);
            } else {
                $(this).toggle(false);
            }
        });
    });
});
