<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <link href="/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
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
            <!--<li class="nav-item active">
                <a class="nav-link" href="/project">Add Project <span class="sr-only">(current)</span></a>
            </li> -->
            <li class="nav-item">
                <a class="nav-link" href="/project-tracker">Add Project</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/project-tracker/report">Show Projects</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/project-tracker/report/summary">Summary<span
                            class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row" id="summary">
                <div class="col-md-12 mx-auto">
                    <div class="bg-white rounded-lg shadow-sm p-5">
                        <hr/>
                        <h3 class="text-center">
                            Summary Report
                        </h3>
                        <hr/>
                        <#if hasData?? >
                            <table id="reports" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                <tr>
                                    <th class="font-weight-bold">Project Summary</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td/>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width:100%">
                                            <thead>
                                            <tr>
                                                <th/>
                                                <th colspan="3" class="text-center font-weight-bold">Spatial</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td/>
                                                <td>Strength</td>
                                                <td>Need</td>
                                                <td>Opportunity</td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Count</td>
                                                <td><#if spatialData['Strength']??>#{spatialData['Strength'].count}<#else>0</#if></td>
                                                <td><#if spatialData['Need']??>#{spatialData['Need'].count}<#else>0</#if></td>
                                                <td><#if spatialData['Opportunity']??>#{spatialData['Opportunity'].count}<#else>0</#if></td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Total Cost</td>
                                                <td><#if spatialData['Strength']??>#{spatialData['Strength'].sum}<#else>0</#if></td>
                                                <td><#if spatialData['Need']??>#{spatialData['Need'].sum}<#else>0</#if></td>
                                                <td><#if spatialData['Opportunity']??>#{spatialData['Opportunity'].sum}<#else>0</#if></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td/>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width:100%">
                                            <thead>
                                            <tr>
                                                <th/>
                                                <th colspan="3" class="text-center font-weight-bold">Temporal</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td/>
                                                <td>Immediate</td>
                                                <td>Medium</td>
                                                <td>Long</td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Count</td>
                                                <td><#if temporalData['Immediate']??>#{temporalData['Immediate'].count}<#else>0</#if></td>
                                                <td><#if temporalData['Medium']??>#{temporalData['Medium'].count}<#else>0</#if></td>
                                                <td><#if temporalData['Long']??>#{temporalData['Long'].count}<#else>0</#if></td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Total Cost</td>
                                                <td><#if temporalData['Immediate']??>#{temporalData['Immediate'].sum}<#else>0</#if></td>
                                                <td><#if temporalData['Medium']??>#{temporalData['Medium'].sum}<#else>0</#if></td>
                                                <td><#if temporalData['Long']??>#{temporalData['Long'].sum}<#else>0</#if></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td/>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width:100%">
                                            <thead>
                                            <tr>
                                                <th/>
                                                <th colspan="5" class="text-center font-weight-bold">Type</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td/>
                                                <td>Care</td>
                                                <td>Comprehension</td>
                                                <td>Cure</td>
                                                <td>Resilience</td>
                                                <td>Prevention</td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Count</td>
                                                <td><#if typeData['Care']??>#{typeData['Care'].count}<#else>0</#if></td>
                                                <td><#if typeData['Comprehension']??>#{typeData['Comprehension'].count}<#else>0</#if></td>
                                                <td><#if typeData['Cure']??>#{typeData['Cure'].count}<#else>0</#if></td>
                                                <td><#if typeData['Resilience']??>#{typeData['Resilience'].count}<#else>0</#if></td>
                                                <td><#if typeData['Prevention']??>#{typeData['Prevention'].count}<#else>0</#if></td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Total Cost</td>
                                                <td><#if typeData['Care']??>#{typeData['Care'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Comprehension']??>#{typeData['Comprehension'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Cure']??>#{typeData['Cure'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Resilience']??>#{typeData['Resilience'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Prevention']??>#{typeData['Prevention'].sum}<#else>0</#if></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <br/>
                            <div class="container bg-light" id="pbuttons">
                                <div class="col-md-12 text-center" id="buttons">
                                    <input type="button" id="pdf" onclick="generatePDF()" value="Export to PDF"
                                           class="btn btn-primary shadow-sm mr-3"/>
                                </div>
                            </div>
                        <#else>
                            <div class="alert alert-info">
                                <h3> No Project Data Found!</h3>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/html2pdf.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#reports').DataTable({
            lengthChange: false,
            searching: false,
            paging: false,
            sort: false,
            responsive: true,
            info: false
        });
    });

    function generatePDF() {
        const buttons = document.getElementById("buttons");
        document.getElementById("pbuttons").removeChild(buttons);
        html2pdf()
            .from(document.getElementById('summary'))
            .save("summary_report_" + (new Date().toUTCString().replaceAll(/[^A-Z0-9]/ig, '_')));
        setTimeout(function () {
            document.getElementById("pbuttons").appendChild(buttons);
        }, 100);
    }
</script>
</body>
</html>
