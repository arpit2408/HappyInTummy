package happytummy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import happytummy.beans.MenuItems;
import happytummy.beans.Plans;
import happytummy.utils.DBUtils;
import happytummy.connect.ConnectionUtils;

/**
 * Servlet implementation class CheckoutServlet
 */
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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
		 System.out.println("Entered doPost of checkout Servlet"); //test
		 Connection conn;
		try {
			    conn = ConnectionUtils.getConnection();
		       
		        int preference=0;
		        int height=0;
		        String gender="";
		        String name="";
		        String phone="";
		        String email="";
		        String address="";
		        String city="";
		        String state="";
		        int weight=0;
		        String zip="";
		        String dob="";
		        int planId=0;
		        ArrayList bkitems=new ArrayList<>();
		        ArrayList litems=new ArrayList<>();
		        ArrayList ditems=new ArrayList<>();
		        JSONParser parser = new JSONParser();
		        try {    
		        if(request.getParameter("pref")!=null)
		        {
		        	preference=Integer.parseInt(request.getParameter("pref"));
		        }
		        if(request.getParameter("weight")!=null && !((request.getParameter("weight")).toString().equals("")))
		        {
		        	weight=Integer.parseInt(request.getParameter("weight"));
		        }
		        if(request.getParameter("height")!=null && !((request.getParameter("height")).toString().equals("")))
		        {
		        	height=Integer.parseInt(request.getParameter("height"));
		        }
		        if(request.getParameter("gender")!=null && !((request.getParameter("gender")).toString().equals("")))
		        {
		        	gender=(request.getParameter("gender")).toString();
		        }
		        if(request.getParameter("Name")!=null && !((request.getParameter("Name")).toString().equals("")))
		        {
		        	name=(request.getParameter("Name")).toString();
		        }
		        if(request.getParameter("Phone")!=null && !((request.getParameter("Phone")).toString().equals("")))
		        {
		        	phone=(request.getParameter("Phone")).toString();
		        }

		        if(request.getParameter("Email")!=null && !((request.getParameter("Email")).toString().equals("")))
		        {
		        	email=(request.getParameter("Email")).toString();
		        }
		        if(request.getParameter("Address")!=null && !((request.getParameter("Address")).toString().equals("")))
		        {
		        	address=(request.getParameter("Address")).toString();
		        }
		        if(request.getParameter("City")!=null && !((request.getParameter("City")).toString().equals("")))
		        {
		        	city=(request.getParameter("City")).toString();
		        }
		        if(request.getParameter("State")!=null && !((request.getParameter("State")).toString().equals("")))
		        {
		        	state=(request.getParameter("State")).toString();
		        }
		        if(request.getParameter("Zip")!=null && !((request.getParameter("Zip")).toString().equals("")))
		        {
		        	zip=(request.getParameter("Zip")).toString();
		        }
		        if(request.getParameter("DOB")!=null && !((request.getParameter("DOB")).toString().equals("")))
		        {
		        	dob=(request.getParameter("DOB")).toString();
		        	
		        }
		        if(request.getParameter("PlanId")!=null && !((request.getParameter("PlanId")).toString().equals("")))
		        {
		        	planId=Integer.parseInt(request.getParameter("PlanId"));
		        	
		        }
		        if(request.getParameter("bkitems")!=null && !((request.getParameter("bkitems")).toString().equals("")))
		        {
		        	
		        	JSONArray jsonarr = (JSONArray) parser.parse(request.getParameter("bkitems"));
		        	
		        	
		        	for(int i=0;i<jsonarr.size();i++){
		        		bkitems.add(jsonarr.get(i));
		              
		              }
		        }
		        if(request.getParameter("litems")!=null && !((request.getParameter("litems")).toString().equals("")))
		        {
		        	
		        	JSONArray jsonarr = (JSONArray) parser.parse(request.getParameter("litems"));
		        	
		        	for(int i=0;i<jsonarr.size();i++){
		        		litems.add(jsonarr.get(i));
		              
		              }
		        }
		        if(request.getParameter("ditems")!=null && !((request.getParameter("ditems")).toString().equals("")))
		        {
		        	
		        	JSONArray jsonarr = (JSONArray) parser.parse(request.getParameter("ditems"));
		        	
		        	for(int i=0;i<jsonarr.size();i++){
		        		ditems.add(jsonarr.get(i));
		              
		              }
		        }
		    
		       
		      
		        DBUtils.insertRecord(conn,preference, height, weight, gender, 29,name,phone,email,address,state,city,zip,bkitems,litems,ditems,planId); //pending to change
		       
		        } 
		        catch (Exception e) {
		            e.printStackTrace();
		           
		        }
		       
				
		        
		        
		       
	    
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
	}

}
