<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String day = request.getParameter("day");
    String mealType = request.getParameter("mealType");
    String mealContent = request.getParameter("mealContent");

    String column = "";
    if (mealType.equals("Breakfast")) column = "breakfast";
    else if (mealType.equals("Lunch")) column = "lunch";
    else if (mealType.equals("Dinner")) column = "dinner";

    if (!column.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelmanagementsystem", "root", "Dhiraj@1234");

            String query = "UPDATE menu_schedule SET " + column + " = ? WHERE day_of_week = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, mealContent);
            stmt.setString(2, day);

            int rowsUpdated = stmt.executeUpdate();
            out.print(rowsUpdated > 0 ? "Update successful" : "Update failed");

            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }else {
        out.print("Error: Missing parameters.");
    }
%>
