import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Options")
public class Options extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Check if a specific title is selected
		String selectedTitleIdParam = request.getParameter("selectedTitleId");

		if (selectedTitleIdParam != null && !selectedTitleIdParam.isEmpty()) {
			// If a specific title is selected, retrieve times for that title
			int selectedTitleId = Integer.parseInt(selectedTitleIdParam);
			retrieveTimesForTitle(selectedTitleId, out);
		} else {
			// If no specific title is selected, retrieve all titles
			retrieveAllTitles(out);
		}
	}

	private void retrieveAllTitles(PrintWriter out) {
		try {
			Class.forName("org.postgresql.Driver");
			String jdbcUrl = "jdbc:postgresql://localhost:5432/cinema";
			String dbUser = "postgres";
			String dbPassword = "admin";
			Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

			String query = "SELECT * FROM title";
			try (PreparedStatement preparedStatement = connection.prepareStatement(query);
					ResultSet resultSet = preparedStatement.executeQuery()) {
				StringBuilder jsonResult = new StringBuilder("[");
				while (resultSet.next()) {
					int titleId = resultSet.getInt("titleId");
					String titleName = resultSet.getString("title");
					jsonResult.append("{\"id\":").append(titleId).append(",\"name\":\"").append(titleName)
							.append("\"},");
				}
				if (jsonResult.charAt(jsonResult.length() - 1) == ',') {
					jsonResult.deleteCharAt(jsonResult.length() - 1);
				}
				jsonResult.append("]");
				out.println(jsonResult.toString());
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	private void retrieveTimesForTitle(int titleId, PrintWriter out) {
		try {
			Class.forName("org.postgresql.Driver");
			String jdbcUrl = "jdbc:postgresql://localhost:5432/cinema";
			String dbUser = "postgres";
			String dbPassword = "admin";
			Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

			// Retrieve times for the selected title
			String timeQuery = "SELECT * FROM title WHERE titleid = ?";
			try (PreparedStatement timeStatement = connection.prepareStatement(timeQuery)) {
				timeStatement.setInt(1, titleId);
				try (ResultSet timeResultSet = timeStatement.executeQuery()) {
					StringBuilder jsonResult = new StringBuilder("[");
					while (timeResultSet.next()) {
						for (int i = 1; i <= 6; i++) {
							String columnName = "time" + i;
							String timeValue = timeResultSet.getString(columnName);
							jsonResult.append("{\"id\":").append(i).append(",\"value\":\"").append(timeValue)
									.append("\"},");
						}
					}
					if (jsonResult.charAt(jsonResult.length() - 1) == ',') {
						jsonResult.deleteCharAt(jsonResult.length() - 1);
					}
					jsonResult.append("]");
					out.println(jsonResult.toString());
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}