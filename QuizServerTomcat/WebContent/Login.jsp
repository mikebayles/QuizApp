<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Schedule Manager</title>
		
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="http://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
		
		<link href='http://fonts.googleapis.com/css?family=Just+Me+Again+Down+Here' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="login.css" type="text/css" >
		
		<script>
			function ajaxLogin()
			{			
				var json = "json=%7B'username':'" + $('#username').val() + "','password':'"+ $('#password').val() + "'%7D";
				//json=%7B'username':'michael.bayles','password':'bayles'%7D&method=isTeacher
				$.post('LoginServlet?method=authorize&' + json, function(data){
					
					if(data == "TRUE")
					{
						alert("We are good to go");
						//var role = $("#role").val();
						//window.location = role + '.php';
					}
					else
						$("#response").html("<pre>Invalid Username/Password</pre>");
				
				});
			}
			
		</script>
	</head>
	<body>
		<div id="wrapper">
			<form id="login" action="javascript:ajaxLogin();" method="post">
				<table>
					<tr>
						<th>Username :</th>
						<td>
							<input type="text" id="username" name="username" required="required" maxlength="30">
						</td>
					</tr>
					
					<tr>
						<th>Password :</th>
						<td>
							<input type="password" id="password" name="password" required="required" maxlength="30">
						</td>
					</tr>
					
					<tr>
						<th>
							<input type="submit" id="submit" value="login">
						</th>
					</tr>
					
				</table>
				
				<div id="response"></div>
			</form>
		</div>
	</body>
</html>