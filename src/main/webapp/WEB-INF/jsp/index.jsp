<!DOCTYPE HTML>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>My To-Do List</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- use the latest rendering engine -->
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/custom.css">
    <script src="static/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">HOME</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="newTask">New Task</a></li>
      <li><a href="allTasks">All Tasks</a></li>
    </ul>
  </div>
</nav>

<jstl:choose>
	<jstl:when test="${page == 'MAIN'}">
		<div class="container" id="homeDiv">
			<div class="jumbotron text-center">
				<h1>Welcome to my To-Do List</h1>
			</div>
		</div>
	</jstl:when>
	
	<jstl:when test="${page == 'TASKS'}">
		<div class="container text-center" id="taskDiv">
			<h3>To-Do List</h3>	<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="text-center">Id</th>
								<th class="text-center">Task Title</th>
								<th class="text-center">Task Description</th>
								<th class="text-center">Date Created</th>
								<th class="text-center">Finished</th>
								<th class="text-center">Update</th>
								<th class="text-center">Remove</th>
							</tr>
						</thead>
					<tbody>
						<jstl:forEach var="jstl_task" items="${jstl_tasks}">
							<tr>
								<td>${jstl_task.id}</td>
								<td>${jstl_task.name}</td>
								<td>${jstl_task.description}</td>
								<td>${jstl_task.dateCreated}</td>
								<td>${jstl_task.finished}</td>
								<td><a href="retrieveTask?id=${jstl_task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a href="removeTask?id=${jstl_task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
						</jstl:forEach>				
					</tbody>
				</table>
			</div>
		</div>
	</jstl:when>
	
	<jstl:when test="${page == 'NEWTASK'}">
	<div class="container text-center">
	<h3>Add New Task</h3> <hr>
		<form class="form-horizontal" method="POST" action="addTask">
			<input type="hidden" name="id" value="${jstl_task.id}"/>
			
				<div class="form-group">
					<label class="control-label col-md-3">Task Title</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="name" value="${jstl_task.name}"/>
						</div>				
				</div>
				
				<div class="form-group">
					<label class="control-label col-md-3">Task Description</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="description" value="${jstl_task.description}"/>
						</div>				
				</div>
		
		<div class="form-group">
			<input type="submit" class="btn btn-success" value="Add"/>
				</div>
		</form>
	</div>
	</jstl:when>
	
	<jstl:when test="${page == 'UPDATETASK'}">
		<div class="container text-center">
	<h3>Update Task</h3> <hr>
		<form class="form-horizontal" method="POST" action="addTask">
			<input type="hidden" name="id" value="${jstl_task.id}"/>
				
				<div class="form-group">
					<label class="control-label col-md-3">Task Title</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="name" value="${jstl_task.name}"/>
						</div>				
				</div>
		
			<div class="form-group">
				<label class="control-label col-md-3">Task Description</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="description" value="${jstl_task.description}"/>
					</div>				
			</div>
		
			<div class="form-group">
				<label class="control-label col-md-3">Finished</label>
					<div class="col-md-6">
						<input type="radio" class="col-sm-1" name="finished" value="true" checked/>
							<div class="col-sm-1">Yes</div>
								<input type="radio" class="col-sm-1" name="finished" value="false"/>
							<div class="col-sm-1">No</div>
					</div>				
			</div>		
			
			<div class="form-group">
				<input type="submit" class="btn btn-success" value="Update"/>
			</div>
		</form>
	</div>
	</jstl:when>
	
</jstl:choose>
</body>
</html>