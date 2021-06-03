<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
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
            <li class="nav-item active">
                <a class="nav-link" href="/project-tracker">Add Project</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/project-tracker/report">Show Projects</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/project-tracker/report/summary">Summary</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 mx-auto">
            <div class="bg-white rounded-lg shadow-sm p-5">
                <hr/>
                <h3 class="text-center">
                    Add New Project
                </h3>
                <hr/>
                <#if projectTracker?? >
                    <div class="alert alert-success">
                        <h4>Project successfully created !</h4>
                    </div>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td>
                                Project Name
                            </td>
                            <td>
                                ${projectTracker.projectName}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Cost
                            </td>
                            <td>
                                ₹ ${projectTracker.cost}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Type
                            </td>
                            <td>
                                ${projectTracker.type}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Spatial
                            </td>
                            <td>
                                ${projectTracker.spatial}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Temporal
                            </td>
                            <td>
                                ${projectTracker.temporal}
                            </td>
                        </tr>
                        </tbody>
                    </table>
                <#else>
                    <form role="form" action="/project-tracker" method="post">
                        <div class="form-group mx-auto">
                            <label class="h6" for="projectName">
                                Project Name
                            </label>
                            <input type="text" class="form-control" maxLength="128" name="projectName"
                                   width="40" required="required"/>
                        </div>
                        <div class="form-group mx-auto">
                            <label class="h6" for="cost">
                                Cost In ₹
                            </label>
                            <input type="number" class="form-control" name="cost" pattern="\d+(\.\d{1,2})?"
                                   required="required"/>
                        </div>
                        <div class="form-group mx-auto">
                            <fieldset class="border p-2">
                                <legend class="w-auto h6">Select Spatial</legend>
                                <section>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input with-gap" type="radio" name="spatial"
                                               value="Strength" checked/>
                                        <label class="form-check-label" for="Strength">Strength</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input with-gap" type="radio" name="spatial"
                                               value="Need"/>
                                        <label class="form-check-label" for="Need">Need</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input with-gap" type="radio" name="spatial"
                                               value="Opportunity"/>
                                        <label class="form-check-label" for="Opportunity">Opportunity</label>
                                    </div>
                                </section>
                            </fieldset>
                        </div>
                        <div class="form-group mx-auto">
                            <fieldset class="border p-2">
                                <legend class="w-auto h6">Select Temporal</legend>
                                <section>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="temporal"
                                               value="Immediate" checked="checked"/>
                                        <label class="form-check-label" for="Immediate">Immediate</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="temporal"
                                               value="Medium"/>
                                        <label class="form-check-label" for="Medium">Medium</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="temporal"
                                               value="Long"/>
                                        <label class="form-check-label" for="Long">Long</label>
                                    </div>
                                </section>
                            </fieldset>
                        </div>
                        <div class="form-group mx-auto">
                            <fieldset class="border p-2">
                                <legend class="w-auto h6">Select Type</legend>
                                <section>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="type"
                                               value="Comprehension" checked="checked"/>
                                        <label class="form-check-label"
                                               for="Comprehension">Comprehension</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="type"
                                               value="Prevention"/>
                                        <label class="form-check-label" for="Prevention">Prevention</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="type" value="Care"/>
                                        <label class="form-check-label" for="Care">Care</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="type" value="Cure"/>
                                        <label class="form-check-label" for="Cure">Cure</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="type"
                                               value="Resilience"/>
                                        <label class="form-check-label" for="Resilience">Resilience</label>
                                    </div>
                                </section>
                            </fieldset>
                        </div>
                        <br/>
                        <div class="container bg-light">
                            <div class="col-md-12 text-center">
                                <input type="submit" class="btn btn-primary shadow-sm mr-3" value="Submit"/>
                                <input type="reset" class="btn btn-danger shadow-sm" value="Reset"/>
                            </div>
                        </div>
                    </form>
                </#if>
            </div>
        </div>
    </div>
</div>
<script src="/js/main.js"></script>
</body>
</html>
