package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Fetch the data Title | Content
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        Note note = new Note(title, content, new Date());

	        System.out.printf(note.getId() + " " + note.getTitle() + " " + note.getContent());
	        
	        Session session = FactoryProvider.getSessionFactory().openSession();
	        session.beginTransaction();
	        session.persist(note);
	        session.getTransaction().commit();
	        session.close();
	        
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<h1 style='text-align:center;'>Note is added successfully!</h1>");
	        out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes...</a></h1>");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Occure error" + e.getMessage());
			e.printStackTrace();
		}
	}

}
