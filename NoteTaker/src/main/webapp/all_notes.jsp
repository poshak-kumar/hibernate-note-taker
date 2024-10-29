<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file='bootstrap_css_js.jsp'%>
<title>All Notes</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file='navbar.jsp'%>
		<br>
		<h1 class="text-center">All Notes</h1>
	</div>
	<div class="container">
	<div class="row">
			<div class="col-12">
				<%
				Session openSession = FactoryProvider.getSessionFactory().openSession();
				Query q = openSession.createQuery("from Note");
				List<Note> notesList = q.list();
				for (Note n : notesList) {
				%>
				<div class="card mt-4">
					<div class="container text-center">
						<img alt="note-image" src="img/sticky-notes.png"style="max-width: 100px;">
					</div>
					<div class="card-body">
						<div class="container text-center">
						<h5 class="card-title"><%out.println(n.getTitle()); %></h5>
						<p class="card-text"><%out.println(n.getContent()); %></p>
						<h6 class="card-text"><%out.println("Added date: " + n.getAddedDate()); %></h6>
						<div class="container">
						<a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
						<a href="update_notes.jsp?note_id=<%=n.getId() %>" class="btn btn-primary">Update</a>
						</div>
						</div>
					</div>
				</div>

				<%
				}
				openSession.close();
				%>
			</div>
		</div>
	</div>

</body>
</html>