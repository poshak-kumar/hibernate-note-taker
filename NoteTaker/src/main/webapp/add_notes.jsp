<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file='bootstrap_css_js.jsp' %>
    <title>Add Notes</title>
</head>
<body>
    <div class="container-fluid">
        <%@include file='navbar.jsp' %>
    </div>
    <div class="container">
        <!--The Add Note Form -->

        <h1>Fill your note details</h1>
        <br>

        <form action="SaveNoteServlet" method="post">
            <div class="mb-3">
              <label for="title" class="form-label">Note Title</label>
              <input type="text" 
              name="title"
              class="form-control"
              id="title"
              placeholder="enter title here" 
              required>
              <div class="form-text">Please fill your note title.</div>
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">Note Content</label>
              <textarea 
              type="text" 
              name="content"
              placeholder="enter your content here"
              class="form-control" 
              id="content"
              style="height: 200px;" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add</button>
          </form>
    </div>
</body>
</html>