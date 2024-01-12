

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
import javax.servlet.http.HttpSession;





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

//	private void showAll(HttpServletRequest request) {
//		StringBuilder sb = new StringBuilder();
//		String line;
//		try(BufferedReader rd = request.getReader()){
////			line=rd.readLine();
////			(line!=null) {
//			while ((line=rd.readLine())!=null) {
//				sb.append(line).append("\n");
//			}
//		} catch (IOException e) {
//			// TODO 自動生成された catch ブロック
//			e.printStackTrace();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		String requestBody = sb.toString();
//		System.out.println("requestBody : "+requestBody);
//	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
	    int memberId = (int) session.getAttribute("session_memberId");
		
		PrintWriter out = response.getWriter();
		
		//showAll(request);
		//int age = Integer.parseInt(request.getParameter("age"));
		String[] seats = request.getParameterValues("seats");
		//String seats =  "S1,S2";
		//String[] seats_array = {"S1", "S2"};
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String total = request.getParameter("total");
		String freewrite = request.getParameter("freewrite");
		

		
		try 
		{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/classic", "postgres", "admin");
			con.setAutoCommit(false); // トランザクションを開始
//			for (int i = 0; i < seats_array.length; i++)
//			{
//				System.out.println(seats_array[i]);
//			}
			int count = 0;
			
			
			for(String seat : seats)
			{
				System.out.println(seat);
				
				PreparedStatement ps = con.prepareStatement("insert into reservetable (seat, date, time, total, freewrite, memberId) values(?, ?, ?, ?, ?, ?)  ") ;
				//ps.setInt(1, age);
				//ps.setString(1, seats);
				ps.setString(1, seat);
				ps.setString(2, date);
				ps.setString(3, time);
				ps.setString(4, total);
				ps.setString(5, freewrite);
				ps.setInt(6, memberId);

				
				count += ps.executeUpdate();
				//count = count+ps.executeUpdate();
			}
			
			 	
			if(count == seats.length)
			{	con.commit(); // トランザクションをコミット
			
				response.setContentType("text/html; charset=UTF-8");
				out.print("<h3 style='color:green'> 予約が完了しました。 </h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
				rd.include(request, response);
			}
			else
			{
				con.rollback(); // トランザクションをロールバック
				response.setContentType("text/html; charset=UTF-8");
				out.print("<h3 style='color:red'> エラーが発生しました。 </h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/reserve.jsp");
				rd.include(request, response);
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
			response.setContentType("text/html; charset=UTF-8");
			out.println("<h3 style='color:red'> エラーが発生しました再度お試しください </h3>");
			System.out.println(" Exception Occured"+e.getMessage()+" </h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("/reserve.jsp");
			rd.include(request, response);
		}
		
	}

}

