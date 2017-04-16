/**
 * Created by Neetika Mittal
 *
 * For getting menu from Database for sample menu
 */
package happytummy.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import happytummy.beans.MenuItems;
import happytummy.utils.DBUtils;
import happytummy.connect.ConnectionUtils;

/**
 * Servlet implementation class MenuItemsList
 */
public class MenuItemsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuItemsList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("Entered doget"); //test
		 Connection conn;
		try {
			   conn = ConnectionUtils.getConnection();
		       // Set Auto commit to false
		       conn.setAutoCommit(false);
		      /* // Store connection in attribute of request.
		       MyUtils.storeConnection(request, conn);
			   conn = MyUtils.getStoredConnection(request);*/
		        String errorString = null;
		        List<MenuItems> listVegan = null;
		        List<MenuItems> listNonVeg = null;
		        List<MenuItems> listGlutenFree = null;
		        try {
		        	listVegan = DBUtils.queryMenu(conn,1);
		        	listNonVeg = DBUtils.queryMenu(conn,2);
		        	System.out.println(listNonVeg.size());
		        	listGlutenFree = DBUtils.queryMenu(conn,3);
		            //System.out.println("menu from db for vegan "+listVegan.get(0).getItem_Name().toString()); //test
		            //System.out.println("menu from db for non veg "+listNonVeg.get(0).getMeal_Type().toString()); //test
		        } catch (SQLException e) {
		            e.printStackTrace();
		            errorString = e.getMessage();
		        }
		        
		        request.setAttribute("errorString", errorString);
		        request.setAttribute("listVegan", listVegan);
		        request.setAttribute("listNonVeg", listNonVeg);
		        request.setAttribute("listGlutenFree", listGlutenFree);
		        RequestDispatcher dispatcher = this.getServletContext()
		                .getRequestDispatcher("/sample-menu.jsp");
		        dispatcher.forward(request, response);
	    
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
	}
}

