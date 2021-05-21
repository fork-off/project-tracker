<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link href="/css/main.css" rel="stylesheet">
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
<#if projectTrackers?? >
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    Project
                </th>
                <th>
                    Cost
                </th>
                <th>
                    Spatial
                </th>
                <th>
                    Temporal
                </th>
                <th>
                    Type
                </th>
                <th>
                </th>
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
                <td><input type="button" onClick="redirectTo(${projectTracker.id})" value="Edit Project"/></td>
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
function  redirectTo(id)
{
form=document.getElementById("editForm");
form.action="/project-tracker?id="+id;
form.submit();

}

</script>
</body>
</html>
