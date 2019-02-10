var input = "global";
var table = "global";
var rows = "global";
var k = "global";
var cell = "global";
var txtValue = "global";
var column = "global";
var firstInput = "global";

function skill_search() {
    input = document.getElementById("skill").value.toUpperCase();
    table = document.getElementById("myTable");
    rows = table.getElementsByTagName("tr");
    for (k = 0; k < rows.length; k++) {
        cell = rows[k].getElementsByTagName("td")[4];
        if (cell) {
            txtValue = cell.textContent;
            if (txtValue.toUpperCase().indexOf(input) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function cgpa_search() {
    input = parseFloat(document.getElementById("cgpa").value);
    firstInput = document.getElementById("cgpa").value;
    table = document.getElementById("myTable");
    rows = table.rows;
    for (k = 1; k < rows.length; k++) {
        cell = rows[k].cells[1].textContent;
        column = rows[k].getElementsByTagName("td")[1];
        if (firstInput.length >= 4) {
            if (input < cell) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        } else {
            txtValue = column.textContent;
            if (txtValue.indexOf(firstInput) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function uni_search() {
    input = document.getElementById("uni_name").value.toUpperCase();
    table = document.getElementById("myTable");
    rows = table.getElementsByTagName("tr");
    for (k = 0; k < rows.length; k++) {
        cell = rows[k].getElementsByTagName("td")[2];
        if (cell) {
            txtValue = cell.textContent;
            if (txtValue.toUpperCase().indexOf(input) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function salary_range_search() {
    var min_salary = parseInt(document.getElementById("min_salary").value);
    var max_salary = parseInt(document.getElementById("max_salary").value);
    table = document.getElementById("myTable");
    rows = table.rows;
    for (k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[5].textContent;
        if (
            (cell>=min_salary)&&(max_salary>=cell) ||
            (isNaN(min_salary)&&(max_salary>=cell)) ||
            ((cell>=min_salary)&&isNaN(max_salary)) ||
            (isNaN(min_salary))&&isNaN(max_salary)
        ) {
            rows[k].style.display = "";
        } else {
            rows[k].style.display = "none";
        }
    }
}

function experience_range_search() {
    var min_exp = parseInt(document.getElementById("min_exp").value);
    var max_exp = parseInt(document.getElementById("max_exp").value);
    table = document.getElementById("myTable");
    rows = table.rows;
    for (k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[3].textContent;
        if (
            (cell>=min_exp)&&(max_exp>=cell) ||
            (isNaN(min_exp)&&(max_exp>=cell)) ||
            ((cell>=min_exp)&&isNaN(max_exp)) ||
            (isNaN(min_exp))&&isNaN(max_exp)
        ) {
            rows[k].style.display = "";
        } else {
            rows[k].style.display = "none";
        }
    }
}
