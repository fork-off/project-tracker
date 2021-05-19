<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<h1>Project Tracker Info</h1>
<#if projectTracker?? >
    Funder: ${projectTracker.funder}<br>
    Cost: ${projectTracker.cost}<br>
    Project Name: ${projectTracker.project.name}<br>
    Spatial: ${projectTracker.spatial}<br>
    Temporal: ${projectTracker.temporal}<br>
    Type: ${projectTracker.type}<br>
<#else>
    <form action="/project-tracker" method="post">
        <table>
            <tr>
                <td>Funder:</td>
                <td><input type="text" name="funder" required="required"/></td>
            </tr>
            <tr>
                <td>Project Name:</td>
                <td>
                    <select name="project" required="required">
                        <option value="" disabled selected>Select Project</option>
                        <#list projects as project>
                            <option value="${project.id}">${project.name}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Cost:</td>
                <td><input type="text" name="cost" required="required"/></td>
            </tr>
            <tr>
                <td>Spatial:</td>
                <td>
                    <input type="radio" name="spatial" value="STRENGTH" checked="checked"/>STRENGTH
                    <input type="radio" name="spatial" value="NEED"/>NEED
                    <input type="radio" name="spatial" value="OPPORTUNITY"/>OPPORTUNITY
                </td>
            </tr>
            <tr>
                <td>Temporal:</td>
                <td>
                    <input type="radio" name="temporal" value="IMMEDIATE" checked="checked"/>IMMEDIATE
                    <input type="radio" name="temporal" value="MEDIUM"/>MEDIUM
                    <input type="radio" name="temporal" value="LONG"/>LONG
                </td>
            </tr>
            <tr>
                <td>Type:</td>
                <td>
                    <input type="radio" name="type" value="COMPREHENSION" checked="checked"/>COMPREHENSION
                    <input type="radio" name="type" value="PREVENTION"/>PREVENTION
                    <input type="radio" name="type" value="CARE"/>CARE
                    <input type="radio" name="type" value="CURE"/>CURE
                    <input type="radio" name="type" value="RESILIENCE"/>RESILIENCE
                </td>
            </tr>
            <tfoot>
            <tr>
                <td><input type="submit" value="Submit"/></td>
                <td><input type="reset" value="Reset"/></td>
            </tr>
            </tfoot>
        </table>
    </form>
</#if>
<script src="/js/main.js"></script>
</body>
</html>
