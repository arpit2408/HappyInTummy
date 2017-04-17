package happytummy.servlet;

import happytummy.beans.User;
import happytummy.connect.ConnectionUtils;
import happytummy.utils.DBUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateUserDetails
 */
public class UpdateUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entered doPost of UpdateUserDetails");
		Connection conn;
		try {
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
			String activeOrderID="Invalid";
			int updateReturnValue=0;
			boolean cancelOrder=false;
			String errorString = null;
			String customerID=request.getParameter("customerID");
			String street=request.getParameter("Street Address");
			String city=request.getParameter("City");
			String state=request.getParameter("State");
			String zip=request.getParameter("ZIP Code");
			String phone=request.getParameter("Phone number");
			String orderCancel=request.getParameter("Cancel Order");
			if (orderCancel!=null){
				cancelOrder=true;
			}
			try{	
				if (cancelOrder){
					activeOrderID=DBUtils.getActiveOrderID(conn, customerID);
					if (!activeOrderID.equals("Invalid")){
						if (activeOrderID.equals("None")){
							cancelOrder=false;
							updateReturnValue=DBUtils.updateInfo(conn, customerID, activeOrderID, street, city, state, zip, phone, cancelOrder);
							System.out.println(updateReturnValue+" No orders for cancellation");	
							request.setAttribute("displayMessage","There were no orders for cancellation.<br/>Your other information has been updated.");
					        RequestDispatcher dispatcher = this.getServletContext()
					                .getRequestDispatcher("/InfoUpdate.jsp");
					        dispatcher.forward(request, response);
						}else{
							updateReturnValue=DBUtils.updateInfo(conn, customerID,activeOrderID,  street, city, state, zip, phone, cancelOrder);
							System.out.println(updateReturnValue);							
							request.setAttribute("displayMessage","Your order has been cancelled.<br/>");
					        RequestDispatcher dispatcher = this.getServletContext()
					                .getRequestDispatcher("/InfoUpdate.jsp");
					        dispatcher.forward(request, response);
						}
						
					}else{
						response.sendRedirect("errorOccured.html");
					}
				}else{
					updateReturnValue=DBUtils.updateInfo(conn, customerID, activeOrderID, street, city, state, zip, phone, cancelOrder);
					System.out.println(updateReturnValue);
					request.setAttribute("displayMessage","Thank you for updating your information.");
			        RequestDispatcher dispatcher = this.getServletContext()
			                .getRequestDispatcher("/InfoUpdate.jsp");
			        dispatcher.forward(request, response);;
				}
	        
			} catch (Exception e) {
	            e.printStackTrace();
	            errorString = e.getMessage();
	            response.sendRedirect("errorOccured.html");
	        }
			        
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("errorOccured.html");
		}		
	}

}