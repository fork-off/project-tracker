<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css">
    <link href="/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.colVis.min.js"></script>
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-dark static-top">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapseOne">
                    <span class="navbar-toggler-icon"></span>
                </button> <a class="navbar-brand" href="#">Project Tracker</a>
                <div id="collapseOne" class="collapse navbar-collapse">
                    <ul class="navbar-nav">
                        <!--<li class="nav-item active">
                            <a class="nav-link" href="/project">Add Project <span class="sr-only">(current)</span></a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link" href="/project-tracker">Add Project</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/report/project-tracker">Reports <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="bg-white rounded-lg shadow-sm p-5">
                        <h3 class="text-center">
                            Project Tracker Reports
                        </h3>
                        <hr />
<#if projectTrackers?? >
    <table id="reports" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Project</th>
                <th>Cost</th>
                <th>Spatial</th>
                <th>Temporal</th>
                <th>Type</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <#list projectTrackers as projectTracker>
            <tr>
                <td>${projectTracker.projectName}</td>
                <td>${projectTracker.cost}</td>
                <td>${projectTracker.spatial}</td>
                <td>${projectTracker.temporal}</td>
                <td>${projectTracker.type}</td>
                <td><input type="button" id="editForm" onClick="redirectTo(${projectTracker.id})" value="Edit Project"/></td>
            </tr>
        </#list>
        </tbody>
    </table> 
<#else>
    <div class="alert alert-info">
        <h3> No Project Tracker Data Found!</h3>
    </div>
</#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/main.js"></script>
<script>

$(document).ready(function() {
    var table = $('#reports').DataTable( {
        lengthChange: false,
        buttons: [ 'excel', 'pdf', 'colvis' ]
    } );
 
    table.buttons().container()
        .appendTo( '#reports_wrapper .col-md-6:eq(0)' );
} );

</script>
</body>
</html>
