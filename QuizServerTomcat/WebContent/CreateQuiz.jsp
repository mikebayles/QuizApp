<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Schedule Manager</title>
		
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="http://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
		
		<link href='http://fonts.googleapis.com/css?family=Just+Me+Again+Down+Here' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="main.css" type="text/css" >
		
		<script>
			var courses = new Array();
			var nextNumber = 1;			
			var questions = new Array();
			var currentQuestion;
			var currentAnswers = new Array();
			
			$(document).ready(function()
			{
				
				$("#add").click(function(e)
				{
					e.preventDefault();
					
					insertAnswer();
					
					if(nextNumber <5)
					{
						nextNumber++;
						appendAnswer();
					}
				});
				
				$("#next").click(function(e)
				{
					e.preventDefault();
					
					insertAnswer();
					
					insertQuestion();
					
					reset();
				});
				
				$("#submit").click(function(e)
				{
					e.preventDefault();
					
					insertAnswer();
					insertQuestion();
					//reset();
					
					var courseIndex = $("#course").val();
					
					var course = courses[courseIndex];
					var quiz = {'id':0,'description':'','course':course,'questions' : questions};
					
					var json = JSON.stringify(quiz);
					//json=%7B'username':'michael.bayles','password':'bayles'%7D&method=isTeacher
					$.post('aCreateServlet?method=createQuiz&json=' + json, function(data)
					{
						
						alert(data);
					
					});
				});
				
				setInterval(checkPings,1000);
				
			});
			
			function checkPings()
			{
				var username = $("#username").val()
				$.post('QuizServlet?method=getPing&teacher=' + username, function(data)
				{
					if(data.length > 1)
						alert(data);
				
				});
			}
			
			function appendAnswer()
			{
				var newRow = '<tr class="answerRow"><th>Answer ' + nextNumber +'</th>';
				newRow += '<td><input type="text" id="answer' + nextNumber + '" name="answer' + nextNumber + '" placeholder="Answer'+ nextNumber + '">';
				newRow += '<input type="radio" name="is_correct" value="' + nextNumber + '">Correct?</td></tr>';
				$('#answerHolder > tbody:last').append(newRow);
				
			}
			
			function reset()
			{
				nextNumber = 1;
				$("#question").val('');
				$( ".answerRow" ).remove();
				//$("#answerHolder").empty();
				appendAnswer();
				currentAnswers = new Array();
				currentQuestion = null;
			}
			
			function insertAnswer()
			{
				var correct =  $('input[name=is_correct]:checked').val() == nextNumber; 
				var answer = {'id':0,'text':$("#answer"+nextNumber).val(),'correct':correct};
				currentAnswers.push(answer);
			}
			
			function insertQuestion()
			{
				currentQuestion = {'id':0,'text':$("#question").val(),'answers':currentAnswers};
				questions.push(currentQuestion);
			}
			
			function getCourses()
			{			
				//var json = "json=%7B'username':'" + $('#username').val() + "','password':'"+ $('#password').val() + "'%7D";
				//json=%7B'username':'michael.bayles','password':'bayles'%7D&method=isTeacher
				$.post('CreateServlet?method=getCourses', function(data){
					
						var select = document.getElementsByTagName('select')[0];
						select.options.length = 0; // clear out existing items
						courses = jQuery.parseJSON(data).courses;
						for(var i=0; i < courses.length; i++) 
						{
						    var d = courses[i];
						    select.options.add(new Option(d.id + " - " + d.description, i));
						}
				
				});
			}
				
		</script>
	</head>
	<body>
		<% if (session.getAttribute("username") == null) 
		{ 
			String redirectURL = "Login.jsp"; 
		    response.sendRedirect(redirectURL);
		}		
		%>
		
	
	
		<script>getCourses();</script>
		<div id="wrapper">		
			<form>
				<input id="username" type="hidden" name="username" value='<%= session.getAttribute("username")%>'>
				<table id="answerHolder">
					<tbody >
						<tr>
							<th>Select course</th>
							<td><select id="course"></select></td>
						</tr>
						<tr>
							<th>Quiz description</th>
							<td><textarea id="description" name="description" placeholder="quiz description"></textarea></td>
						</tr>
						<tr>
							<th>Question text</th>
							<td><textarea id="question" name="question" placeholder="quiz text"></textarea></td>
						</tr>
						<tr class="answerRow">
							<th>Answer 1</th>							
							<td><input type="text" id="answer1" name="answer1" placeholder="Answer1">
							<input type="radio" name="is_correct" value="true">Correct?</td>
						</tr>
					</tbody>					
				</table>		
				<button id="add">Add Answer</button>
				<button id="next">Next Question</button>
				<button id="submit">Submit</button>
			</form>	
		</div>
	</body>
</html>