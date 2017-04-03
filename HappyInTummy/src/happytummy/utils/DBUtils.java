package happytummy.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import happytummy.beans.MenuItems;
import happytummy.beans.Plans;
import happytummy.beans.User;

 
public class DBUtils {
 
  public static User findUser(Connection conn, String userName, String dob) throws SQLException {
 
      String sql = ""; //need to work on this
 
      PreparedStatement pstm = conn.prepareStatement(sql);
      pstm.setString(1, userName);
      pstm.setString(2, dob);
      ResultSet rs = pstm.executeQuery();
 
      if (rs.next()) {
          
    	  User user = new User();
          user.setCustomer_name(userName);
          user.setBirth_date(dob);
     
          return user;
      }
      return null;
  }
 
  public static List<MenuItems> queryMenu(Connection conn,int preference) throws SQLException {
      String sql = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference;
      System.out.println("sql "+sql);
      PreparedStatement pstm = conn.prepareStatement(sql);
 
      ResultSet rs = pstm.executeQuery();
      List<MenuItems> list = new ArrayList<MenuItems>();
      while (rs.next()) {
    	  int item_ID = rs.getInt("Item_ID");
    	  System.out.println("item_ID "+item_ID);
          String item_Name = rs.getString("Item_Name");
          String item_Desc = rs.getString("Item_Desc");
          int calorie = rs.getInt("Calorie");
          int proteins = rs.getInt("Proteins");
          int fats = rs.getInt("Fats");
          int carbohydrates = rs.getInt("Carbohydrates");
          String image_Name = rs.getString("Image_Name");
          String meal_type=rs.getString("Meal_Type");
          MenuItems menuitem = new MenuItems();
          menuitem.setItem_id(item_ID);
          menuitem.setItem_Name(item_Name);
          menuitem.setItem_Desc(item_Desc);
          menuitem.setCalorie(calorie);
          menuitem.setProteins(proteins);
          menuitem.setFats(fats);
          menuitem.setCarbohydrates(carbohydrates);
          menuitem.setImage_Name(image_Name);
          menuitem.setMeal_Type(meal_type);
          list.add(menuitem);
      }
      return list;
  }

  public static User getUserDetails(Connection conn, String emailID, String dob) throws SQLException {
	  StringBuilder sql=new StringBuilder();
	  sql.append("select c.Customer_Name,DATE_FORMAT(c.DOB,'%d-%b-%Y')'c.DOB', ");
	  sql.append("c.Gender,c.Address,c.City, ");	  
	  sql.append("c.State,c.Phone,c.Email_Id,p.NoWeeks, ");	  
	  sql.append("c.Zip,pref.Preference_Type ");	  
	  sql.append("from happytummy.order_ids o, happytummy.customerdetails c, ");	  
	  sql.append("happytummy.plan p, happytummy.preference pref ");	  
	  sql.append("where o.Customer_ID=c.Customer_ID ");
	  sql.append("and o.Plan_ID=p.Plan_ID ");
	  sql.append("and p.Preference_ID=pref.Preference_ID ");
	  sql.append("and c.DOB=str_to_date('"+dob+"','%d-%M-%Y')");
	  sql.append("and c.Email_Id='"+ emailID+"';");
	  String query= sql.toString();
	  System.out.println("Query: "+query);
	  PreparedStatement pstm = conn.prepareStatement(query);	  
      ResultSet rs = pstm.executeQuery();
      User user = new User();
      while (rs.next()){     
      user.setCustomer_name(rs.getString("c.Customer_Name"));
      user.setBirth_date(rs.getString("c.DOB"));
      user.setGender(rs.getString("c.Gender"));
      user.setAddress(rs.getString("c.Address"));
      user.setCity(rs.getString("c.City"));
      user.setState(rs.getString("c.State"));
      user.setPostal_zip(rs.getInt("c.Zip"));
      user.setPhone_number(rs.getString("c.Phone"));
      user.setEmail_id(rs.getString("c.Email_Id"));
      user.setPreference(rs.getString("pref.Preference_Type"));
      user.setNoOfWeeks(rs.getString("p.NoWeeks"));
      }
      return user;
	  
  }

  public static List<Plans> getPlans(Connection conn,int preference) throws SQLException {
      String sql = "select Plan_ID, Cost, NoWeeks from happytummy.plan where Preference_ID="+preference;
      System.out.println("sql "+sql);
      PreparedStatement pstm = conn.prepareStatement(sql);
 
      ResultSet rs = pstm.executeQuery();
      List<Plans> list = new ArrayList<Plans>();
      while (rs.next()) {
    	  int plan_id = rs.getInt("Plan_ID");
    	  System.out.println("Plan_ID "+plan_id);
          int Cost = rs.getInt("Cost");
          int weeks = rs.getInt("NoWeeks");
         
          Plans plan = new Plans();
          plan.setPlan_id(plan_id);
          plan.setCost(Cost);
          plan.setNoweeks(weeks);
          list.add(plan);
      }
      return list;
  }
}