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
            <th>Funder</th>
            <th>Cost</th>
            <th>Spatial</th>
            <th>Temporal</th>
            <th>Type</th>
        </tr>
        <#list projectTrackers as projectTracker>
            <tr>
                <td>${projectTracker.project.name}</td>
                <td>${projectTracker.funder}</td>
                <td>${projectTracker.cost}</td>
                <td>${projectTracker.spatial}</td>
                <td>${projectTracker.temporal}</td>
                <td>${projectTracker.type}</td>
            </tr>
        </#list>
    </table>
<#else>
    <h3> No Project Tracker Data Found!</h3>
</#if>
<script src="/js/main.js"></script>
</body>
</html>
