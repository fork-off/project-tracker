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
    Cost: ${projectTracker.cost}<br>
    Project Name: ${projectTracker.projectName}<br>
    Spatial: ${projectTracker.spatial}<br>
    Temporal: ${projectTracker.temporal}<br>
    Type: ${projectTracker.type}<br>
 
<form action="/project-tracker">
<table>
 <tfoot>
            <tr>
                <td><input type="submit"   value="Add Project"/></td>
                 
            </tr>
            </tfoot>
           </table>
          </form> 
    
<#else>
    <form action="/project-tracker" method="post">
        <table>
           <tr>
                <td>Project Name:</td>
                   <td><input type="text" maxLength="128" name="projectName" width="40" required="required"/></td>
                
            </tr>
            <tr>
                <td>Cost In Rs:</td>
                <td><input type="text" name="cost" pattern="\d+(\.\d{1,2})?" required="required"/></td>
            </tr>
            <tr>
                <td>Spatial:</td>
                <td>
                    <input type="radio" name="spatial" value="Strength" checked="checked"/>Strength
                    <input type="radio" name="spatial" value="Need"/>Need
                    <input type="radio" name="spatial" value="Opportunity"/>Opportunity
                </td>
            </tr>
            <tr>
                <td>Temporal:</td>
                <td>
                    <input type="radio" name="temporal" value="Immediate" checked="checked"/>Immediate
                    <input type="radio" name="temporal" value="Medium"/>Medium
                    <input type="radio" name="temporal" value="Long"/>Long
                </td>
            </tr>
            <tr>
                <td>Type:</td>
                <td>
                    <input type="radio" name="type" value="Comprehension" checked="checked"/>Comprehension
                    <input type="radio" name="type" value="Prevention"/>Prevention
                    <input type="radio" name="type" value="Care"/>Care
                    <input type="radio" name="type" value="Cure"/>Cure
                    <input type="radio" name="type" value="Resilience"/>Resilience
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
