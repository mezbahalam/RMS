var searchChanged = 0;
var searchChangedMap = 0;
var currentRequest = null;

$(document).on('turbolinks:load', function(){
    $('#search-form input[type=text]').on('keyup', function(){
        if($(this).attr('data-old') != $(this).val())
        {
            searchChanged ++;
            $(this).attr('data-old', $(this).val());
        }
    });

    var $user_id = $('#search-form input[name=job_id]').val();
    if($user_id !== undefined) {
        if($('#search-form .filter-group input[type=text]')) {
            updateSearch();
        }
    }

    setInterval(function(){
        if(searchChanged === 1 && searchChangedMap === 0)
        {
            updateSearch();
        }
        else if (searchChanged > 1) {
            searchChanged = 1;
        }
    }, 500);

});

function updateSearch() {
    var $user_id = $('#search-form input[name=job_id]').val();
    $.ajax({
        url: '/candidate_jobs/show/'+$user_id,
        method: "GET",
        dataType: "json",
        data: $('#search-form').serialize(),
        success: function (data) {
            console.log('hi');
            if (data.length > 0){
                console.log('hey');
                $('#search-results').removeClass('no-results');
                for (var i in data.people) {
                    var person = data.people[i];
                    $personElement = $('#person-template').clone().prop('id', '');
                }
            } else {

            }
        },
        error: function (msg) {
            console.log('bye');
        }
    });
}
