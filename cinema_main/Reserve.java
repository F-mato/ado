

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reserve
 */
@WebServlet("/Reserve")


public class Reserve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append("Served at:/cinema/Reserve").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		//int age = Integer.parseInt(request.getParameter("age"));
		String seat = request.getParameter("seat");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String total = request.getParameter("total");
		String freewrite = request.getParameter("freewrite");
		
		try 
		{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/reserve", "postgres", "pass67");
			
			PreparedStatement ps = con.prepareStatement("insert into reservetable (seat, date, time, total, freewrite) values(?, ?, ?, ?, ?)") ;
			//ps.setInt(1, age);
			ps.setString(1, seat);
			ps.setString(2, date);
			ps.setString(3, time);
			ps.setString(4, total);
			ps.setString(5, freewrite);
			
			int count = ps.executeUpdate();
			if(count > 0)
			{
				response.setContentType("text/html; charset=UTF-8");
				out.print("<h3 style='color:green'> Reserve successfully </h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
				rd.include(request, response);
			}
			else
			{
				response.setContentType("text/html; charset=UTF-8");
				out.print("<h3 style='color:red'>  error </h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/reserve.jsp");
				rd.include(request, response);
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
			response.setContentType("text/html; charset=UTF-8");
			out.print("<h3 style='color:red'> Exception Occured"+e.getMessage()+" </h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("/reserve.jsp");
			rd.include(request, response);
		}
		
	}

}

