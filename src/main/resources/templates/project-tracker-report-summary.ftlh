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
                                            <thead class="thead-dark">
                                            <tr>
                                                <th width="15%" class="font-weight-bold" style="border-right-style: hidden">Spatial</th>
                                                <th colspan="3"></th>
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
                                                <#assign strengthSum=0/>
                                                <#if spatialData['Strength']??>
                                                    <#assign strengthSum= spatialData['Strength'].sum/>
                                                </#if>
                                                <#assign needSum=0/>
                                                <#if spatialData['Need']??>
                                                    <#assign needSum= spatialData['Need'].sum/>
                                                </#if>
                                                <#assign opportunitySum=0/>
                                                <#if spatialData['Opportunity']??>
                                                    <#assign opportunitySum= spatialData['Opportunity'].sum/>
                                                </#if>
                                                <#assign totalSpatial= strengthSum+needSum+opportunitySum/>
                                                <td class="font-weight-bold">Total Cost</td>
                                                <td>${strengthSum}</td>
                                                <td>${needSum}</td>
                                                <td>${opportunitySum}</td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Percentage Distribution</td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${strengthSum/totalSpatial*100}px;height: 18px;background-color: #56d364;">
                                                            ${(strengthSum/totalSpatial*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 30px;height: 18px;background-color: green;">30%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${needSum/totalSpatial*100}px;height: 18px;background-color: #56d364;">
                                                            ${(needSum/totalSpatial*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 40px;height: 18px;background-color: green;">40%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${opportunitySum/totalSpatial*100}px;height: 18px;background-color: #56d364;">
                                                            ${(opportunitySum/totalSpatial*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 30px;height: 18px;background-color: green;">30%</div>
                                                    </div>
                                                </td>
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
                                            <thead class="thead-dark">
                                            <tr>
                                                <th width="15%" class="font-weight-bold" style="border-right-style: hidden">Temporal</th>
                                                <th colspan="3"></th>
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
                                                <#assign immediateSum=0/>
                                                <#if temporalData['Immediate']??>
                                                    <#assign immediateSum= temporalData['Immediate'].sum/>
                                                </#if>
                                                <#assign mediumSum=0/>
                                                <#if temporalData['Medium']??>
                                                    <#assign mediumSum= temporalData['Medium'].sum/>
                                                </#if>
                                                <#assign longSum=0/>
                                                <#if temporalData['Long']??>
                                                    <#assign longSum= temporalData['Long'].sum/>
                                                </#if>
                                                <#assign totalTemporal= immediateSum+mediumSum+longSum/>
                                                <td class="font-weight-bold">Total Cost</td>
                                                <td>${immediateSum}</td>
                                                <td>${mediumSum}</td>
                                                <td>${longSum}</td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Percentage Distribution</td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${immediateSum/totalTemporal*100}px;height: 18px;background-color: #56d364;">
                                                            ${(immediateSum/totalTemporal*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 15px;height: 18px;background-color: green;">15%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${mediumSum/totalTemporal*100}px;height: 18px;background-color: #56d364;">
                                                            ${(mediumSum/totalTemporal*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 35px;height: 18px;background-color: green;">35%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${longSum/totalTemporal*100}px;height: 18px;background-color: #56d364;">
                                                            ${(longSum/totalTemporal*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 50px;height: 18px;background-color: green;">50%</div>
                                                    </div>
                                                </td>
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
                                            <thead class="thead-dark">
                                            <tr>
                                                <th width="15%" class="font-weight-bold" style="border-right-style: hidden">Type</th>
                                                <th colspan="5"></th>
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
                                                <#assign careSum=0/>
                                                <#if typeData['Care']??>
                                                    <#assign careSum= typeData['Care'].sum/>
                                                </#if>
                                                <#assign comprehensionSum=0/>
                                                <#if typeData['Comprehension']??>
                                                    <#assign comprehensionSum= typeData['Comprehension'].sum/>
                                                </#if>
                                                <#assign cureSum=0/>
                                                <#if typeData['Cure']??>
                                                    <#assign cureSum= typeData['Cure'].sum/>
                                                </#if>
                                                <#assign resilienceSum=0/>
                                                <#if typeData['Resilience']??>
                                                    <#assign resilienceSum= typeData['Resilience'].sum/>
                                                </#if>
                                                <#assign preventionSum=0/>
                                                <#if typeData['Prevention']??>
                                                    <#assign preventionSum= typeData['Prevention'].sum/>
                                                </#if>
                                                <#assign totalType= careSum+comprehensionSum+cureSum+resilienceSum+preventionSum/>

                                                <td class="font-weight-bold">Total Cost</td>
                                                <td><#if typeData['Care']??>${typeData['Care'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Comprehension']??>${typeData['Comprehension'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Cure']??>${typeData['Cure'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Resilience']??>${typeData['Resilience'].sum}<#else>0</#if></td>
                                                <td><#if typeData['Prevention']??>${typeData['Prevention'].sum}<#else>0</#if></td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Percentage Distribution</td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${careSum/totalType*100}px;height: 18px;background-color: #56d364;">
                                                            ${(careSum/totalType*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 40px;height: 18px;background-color: green;">40%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${comprehensionSum/totalType*100}px;height: 18px;background-color: #56d364;">
                                                            ${(comprehensionSum/totalType*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 10px;height: 18px;background-color: green;">10%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${cureSum/totalType*100}px;height: 18px;background-color: #56d364;">
                                                            ${(cureSum/totalType*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 30px;height: 18px;background-color: green;">30%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${resilienceSum/totalType*100}px;height: 18px;background-color: #56d364;">
                                                            ${(resilienceSum/totalType*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 10px;height: 18px;background-color: green;">10%</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray">
                                                        <div style="width: ${preventionSum/totalType*100}px;height: 18px;background-color: #56d364;">
                                                            ${(preventionSum/totalType*100)?string["0.##"]}%
                                                        </div>
                                                    </div>
                                                    <div style="width: 102px;height: 20px;border: 1px solid gray; margin-top: 2px">
                                                        <div style="width: 10px;height: 18px;background-color: green;">10%</div>
                                                    </div>
                                                </td>
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

        var summary = document.getElementById('summary');
        var opt = {
            margin:       1,
            filename:     "summary_report_" + (new Date().toUTCString().replaceAll(/[^A-Z0-9]/ig, '_')),
            image:        { type: 'jpeg', quality: 0.98 },
            html2canvas:  { scale: 2 },
            jsPDF:        { unit: 'in', format: 'ledger', orientation: 'portrait' }
        };
        html2pdf().set(opt).from(summary).save();
        setTimeout(function () {
            document.getElementById("pbuttons").appendChild(buttons);
        }, 100);
    }
</script>
</body>
</html>
