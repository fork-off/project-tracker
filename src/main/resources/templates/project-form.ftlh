<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-dark  fixed-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapseOne">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a href="#" class="navbar-brand">
        <img src="/images/icon.png" height="28" alt=""> Project Tracker
    </a>
    <div id="collapseOne" class="collapse navbar-collapse">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/project-tracker">Add Project</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/project-tracker/report">Show Projects</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/project-tracker/report/summary">Summary</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="bg-white rounded-lg shadow-sm p-5">
                <h3 class="text-center">
                    Add New Project Name
                </h3>
                <hr/>
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
                            <input type="text" class="form-control" name="name" required="required"/>
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

<script src="/js/main.js"></script>
</body>
</html>
