<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file='bootstrap_css_js.jsp'%>
<title>Update Note</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file='navbar.jsp'%>
		<h1 class="text-center">Update Note</h1>
		
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getSessionFactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>
		<div class="container">
			<form action="UpdateServlet" method="post">
			<input value="<%=note.getId()%>" name="noteId" type="hidden"/>
            <div class="mb-3">
              <label for="title" class="form-label">Note Title</label>
              <input type="text" 
              name="title"
              class="form-control"
              id="title"
              placeholder="enter title here" 
              required
              value="<%= note.getTitle()%>">
              <div class="form-text">Update your note title.</div>
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">Note Content</label>
              <textarea 
              type="text" 
              name="content"
              placeholder="enter your content here"
              class="form-control" 
              id="content"
              style="height: 200px;"
              ><%=note.getContent() %></textarea>
            </div>
            <button type="submit" class="btn btn-success">Save Update</button>
          </form>
          <%
          s.close();
          %>
		</div>
	</div>

</body>
</html>