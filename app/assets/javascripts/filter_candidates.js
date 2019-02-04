function SkillSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput1");
    filter = input.value.toUpperCase();
    console.log(filter);
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[4];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
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
    var tr = table.getElementsByTagName("tr");
    for (k = 1; k < tr.length; k++) {
        var cell = rows[k].cells[1].innerText;
        var td = tr[k].getElementsByTagName("td")[1];
        if (filter.length >= 4) {
            if (input < cell) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        } else {
            var txtValue = td.textContent || td.innerText;
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
    var tr = table.getElementsByTagName("tr");
    for (k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[3].innerText;
        var td = tr[k].getElementsByTagName("td")[3];
        if (cell)
        {
            if (input > cell) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = td.textContent || td.innerText;
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
    var tr = table.getElementsByTagName("tr");
    for (k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[3].innerText;
        var td = tr[k].getElementsByTagName("td")[3];
        if (cell)
        {
            if (cell > input) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = td.textContent || td.innerText;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}

function UniSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput4");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function SalarySearch() {
    var input, firstInput, filter, table, rows, k;
    input = parseInt(document.getElementById("myInput5").value);
    firstInput = document.getElementById("myInput2");
    filter = firstInput.value;
    table = document.getElementById("myTable");
    rows = table.rows;
    var tr = table.getElementsByTagName("tr");
    for ( k = 1; k< rows.length; k++) {
        var cell = rows[k].cells[5].innerText;
        var td = tr[k].getElementsByTagName("td")[5];
        if (cell)
        {
            if (input > cell) {
                rows[k].style.display = "none";
            } else {
                rows[k].style.display = "";
            }
        } else {
            var txtValue = td.textContent || td.innerText;
            if (txtValue.indexOf(filter) > -1) {
                rows[k].style.display = "";
            } else {
                rows[k].style.display = "none";
            }
        }
    }
}
