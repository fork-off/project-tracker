<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Tracker</title>
    <link href="/css/main.css" rel="stylesheet">
</head>
<body>
<h1>Project</h1>
<#if project?? >
    Name: ${project.name}<br>
    Description: ${project.description}<br>
<#else>
    <form action="/project" method="post">
        <div>Name:</div>
        <input type="text" name="name" required="required"/>
        <br/><br/>
        <div>Description:</div>
        <textarea rows="2" name="description" required="required"></textarea>
        <br/><br/>
        <input type="submit" value="Submit"/>
        <input type="reset" value="Reset"/>
    </form>
</#if>
<script src="/js/main.js"></script>
</body>
</html>
