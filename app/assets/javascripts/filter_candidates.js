function SkillSearch() {
    var input, filter, table, row, cell, i, txtValue;
    input = document.getElementById("myInput1");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    row = table.getElementsByTagName("tr");
    for (i = 0; i < row.length; i++) {
        cell = row[i].getElementsByTagName("td")[4];
        if (cell) {
            txtValue = cell.textContent;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                row[i].style.display = "";
            } else {
                row[i].style.display = "none";
            }
        }
    }
}

function CGPASearch() {
    var input, firstInput, filter, table, rows, k;
    input = parseFloat(document.getElementById("myInput2").value);
    firstInput = document.getElementById("myInput2");
    filter = firstInput.value;
    table = document.getElementById("myTable");
    rows = table.rows;
    for (k = 1; k < rows.length; k++) {
        var cell = rows[k].cells[1].textContent;
        var column = rows[k].getElementsByTagName("td")[1];
        if (filter.length >= 4) {
            if (input < cell) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        } else {
            var txtValue = column.textContent;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function MinExpSearch() {
    var input, firstInput, filter, table, rows, k;
    input = parseInt(document.getElementById("min").value);
    firstInput = document.getElementById("myInput2");
    filter = firstInput.value;
    table = document.getElementById("myTable");
    rows = table.rows;
    for (k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[3].textContent;
        var column = rows[k].getElementsByTagName("td")[3];
        if (cell)
        {
            if (input > cell) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = column.textContent;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function MaxExpSearch() {
    var input, firstInput, filter, table, rows, k;
    input = parseInt(document.getElementById("max").value);
    firstInput = document.getElementById("myInput2");
    filter = firstInput.value;
    table = document.getElementById("myTable");
    rows = table.rows;
    for (k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[3].textContent;
        var column = rows[k].getElementsByTagName("td")[3];
        if (cell)
        {
            if (cell > input) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = column.textContent;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function UniSearch() {
    var input, filter, table, row, cell, i, txtValue;
    input = document.getElementById("myInput4");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    row = table.getElementsByTagName("tr");
    for (i = 0; i < row.length; i++) {
        cell = row[i].getElementsByTagName("td")[2];
        if (cell) {
            txtValue = cell.textContent;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                row[i].style.display = "";
            } else {
                row[i].style.display = "none";
            }
        }
    }
}

function MinSalarySearch() {
    var input, firstInput, filter, table, rows, k;
    input = parseInt(document.getElementById("myInput5").value);
    firstInput = document.getElementById("myInput2");
    filter = firstInput.value;
    table = document.getElementById("myTable");
    rows = table.rows;
    for ( k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[5].textContent;
        var column = rows[k].getElementsByTagName("td")[5];
        if (cell)
        {
            if (input > cell) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = column.textContent;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function MaxSalarySearch() {
    var maxInput, minInput, firstInput, filter, table, rows, k;
    maxInput = parseInt(document.getElementById("myInput6").value);
    minInput = parseInt(document.getElementById("myInput5").value);
    firstInput = document.getElementById("myInput2");
    filter = firstInput.value;
    table = document.getElementById("myTable");
    rows = table.rows;
    for ( k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[5].textContent;
        var column = rows[k].getElementsByTagName("td")[5];
        if (cell)
        {
            if ((maxInput < cell)) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = column.textContent;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}
