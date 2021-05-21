<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-dark static-top">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="navbar-toggler-icon"></span>
                </button> <a class="navbar-brand" href="#">Project Tracker</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav">
                        <!--<li class="nav-item active">
                            <a class="nav-link" href="/project">Add Project <span class="sr-only">(current)</span></a>
                        </li> -->
                        <li class="nav-item active">
                            <a class="nav-link" href="/project-tracker">Add Project<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/report/project-tracker">Show Projects </a>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="bg-white rounded-lg shadow-sm p-5">
                        <h3 class="text-center">
                            Project Tracker Info
                        </h3>
<#if project?? >
    <div class="alert alert-success">
        <h4>Success !</h4>
        The <strong>${project.name}</strong> has been created.
    </div>
<#else>
    <form role="form" action="/project" method="post">
        <div class="form-group mb-3 mx-auto">
            <label for="exampleInputEmail1">
                Project Name
            </label>
            <input type="text" class="form-control" name="name" required="required" />
        </div>
        <div class="form-group mb-3 mx-auto">
            <label for="exampleInputEmail1">
                Description
            </label>
            <textarea class="form-control" name="description" required="required"></textarea>
        </div>
        <input type="submit" class="btn btn-primary btn-block shadow-sm" value="Submit"/>
        <input type="reset" class="btn btn-danger btn-block shadow-sm" value="Reset"/>
    </form>
</#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/main.js"></script>
</body>
</html>
