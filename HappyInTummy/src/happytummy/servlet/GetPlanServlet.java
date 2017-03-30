package happytummy.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import happytummy.beans.Plans;
import happytummy.utils.DBUtils;
import happytummy.connect.ConnectionUtils;
public class GetPlanServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("Entered doPost of GetPlans"+request.getParameter("pref")); //test
		 Connection conn;
		try {
			    conn = ConnectionUtils.getConnection();
		        conn.setAutoCommit(false);
		        int preference=Integer.parseInt(request.getParameter("pref"));
		        String errorString = null;
		        List<Plans> listPlans = null;
		       
		        try {
		        	listPlans = DBUtils.getPlans(conn, preference);
		        	 } catch (Exception e) {
		            e.printStackTrace();
		            errorString = e.getMessage();
		        }
		        
		        
		        response.setContentType("application/json");
		        response.setHeader("Cache-control", "no-cache, no-store");
		        response.setCharacterEncoding("utf-8");
		        PrintWriter out = response.getWriter();
		        JSONArray array = new JSONArray();
		       
		        
		        
		        for(int i=0;i<listPlans.size();i++)
		        {
		        	JSONObject json = new JSONObject();
		            json.put("id",listPlans.get(i).getPlan_id());
		            json.put("cost", listPlans.get(i).getCost());
		            json.put("weeks",listPlans.get(i).getNoweeks());
		            array.add(json);
		        }

		
		        // finally output the json string       
		        out.print(array);
		        System.out.println(array);   
	    
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		catch (Exception e1) {

			e1.printStackTrace();
		}
		}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
	}

}
