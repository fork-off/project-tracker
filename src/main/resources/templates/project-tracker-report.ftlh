<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<h1>Project Tracker Report</h1>
<#if projectTrackers?? >
    <table cellpadding="2" cellspacing="2" border="1">
        <tr>
            <th>Project</th>
            <th>Cost</th>
            <th>Spatial</th>
            <th>Temporal</th>
            <th>Type</th>
        </tr>
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
    </table>
<#else>
    <h3> No Project Tracker Data Found!</h3>
</#if>
<form action="/project-tracker" id="editForm">
<table>
 <tfoot>
            <tr>
                <td><input type="submit"   value="Add Project"/></td>
                 
            </tr>
            </tfoot>
           </table>
          </form> 
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
