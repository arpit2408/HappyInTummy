/**
 * Created by Neetika Mittal
 *
 * For allocating menu on the basis of age, gender, height and weight
 */
package happytummy.servlet;
import happytummy.beans.MenuItems;
import happytummy.connect.ConnectionUtils;
import happytummy.utils.DBUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
public class BmiBasedMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BmiBasedMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("Entered doPost of Bmi Servlet"); //test
		 Connection conn;
		try {
			    conn = ConnectionUtils.getConnection();
		        // Set Auto commit to false
		        conn.setAutoCommit(false);
		        int preference=0;
		        int height=0;
		        String gender="";
		        int weight=0;
		        String dob="";
		        int age=0;
		        int factor=0;
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
		        if(request.getParameter("DOB")!=null && !((request.getParameter("DOB")).toString().equals("")))
		        {
		        	dob=(request.getParameter("DOB")).toString();
		        	System.out.println(dob);
		        	DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		        	Date birthDate = format.parse(dob);
		        	System.out.println("in Date format "+birthDate);
		        	Calendar birth = new GregorianCalendar();
		            Calendar today = new GregorianCalendar();
		            Date currentDate = new Date(); //current date
		            birth.setTime(birthDate);
		            today.setTime(currentDate);
		        	if(today.get(Calendar.DAY_OF_YEAR) < birth.get(Calendar.DAY_OF_YEAR)) {
		                factor = -1; //birthday not celebrated
		        	}
		        	age = today.get(Calendar.YEAR) - birth.get(Calendar.YEAR) + factor;
		        	System.out.println("AGE (years): "+age);
		        	
		        }
		        String errorString = null;
		        System.out.println("weight"+weight+"height"+height+""+gender);
		        List<MenuItems> menulist = null;
		       
		        try {
		        	menulist = DBUtils.queryMenuBMI(conn,preference, height, weight, gender, age); //pending to change
		       
		            } 
		        catch (SQLException e) {
		            e.printStackTrace();
		            errorString = e.getMessage();
		        }
		        request.setAttribute("preference", preference);
		        request.setAttribute("errorString", errorString);
		        request.setAttribute("menulist", menulist);
		       
				System.out.println("preference"+preference + "siz e of menu"+menulist.size()); 
		        response.setContentType("application/json");
		        response.setHeader("Cache-control", "no-cache, no-store");
		        response.setCharacterEncoding("utf-8");
		        PrintWriter out = response.getWriter();
		        JSONArray array = new JSONArray();
		       
		        
		        
		        for(int i=0;i<menulist.size();i++)
		        {
		        	JSONObject json = new JSONObject();
		        	json.put("itemid",menulist.get(i).getItem_id());
		            json.put("itemname",menulist.get(i).getItem_Name());
		            json.put("itemdesc", menulist.get(i).getItem_Desc());
		            json.put("image",menulist.get(i).getImage_Name());
		            json.put("itemid",menulist.get(i).getItem_id());
		            json.put("calorie",menulist.get(i).getCalorie());
		            json.put("proteins",menulist.get(i).getProteins());
		            json.put("fats",menulist.get(i).getFats());
		            json.put("carbohydrates",menulist.get(i).getCarbohydrates());
		            json.put("meal_Type",menulist.get(i).getMeal_Type());
		    	
		            array.add(json);
		        }

		
		        // finally output the JSON string       
		        out.print(array);
		  
	    
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		catch (Exception ex) {

			ex.printStackTrace();
		}
		}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
	}

}
