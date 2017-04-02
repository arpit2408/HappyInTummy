package happytummy.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 


import happytummy.beans.MenuItems;
import happytummy.beans.Plans;
import happytummy.beans.UserAccount;
 
public class DBUtils {
 
  public static UserAccount findUser(Connection conn, String userName, String dob) throws SQLException {
 
      String sql = ""; //need to work on this
 
      PreparedStatement pstm = conn.prepareStatement(sql);
      pstm.setString(1, userName);
      pstm.setString(2, dob);
      ResultSet rs = pstm.executeQuery();
 
      if (rs.next()) {
          
          UserAccount user = new UserAccount();
          user.setUserName(userName);
          user.setDob(dob);
     
          return user;
      }
      return null;
  }
 
  public static List<MenuItems> queryMenu(Connection conn,int preference) throws SQLException {
      String sql = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference+" and portion="+2;
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
  
  

  public static List<MenuItems> queryMenuBMI(Connection conn,int preference, int height, int weight, String gender, int age) throws SQLException {
     
      
      //For men: BMR = 10 x weight (kg) + 6.25 x height (cm) – 5 x age (years) + 5
      //For women: BMR = 10 x weight (kg) + 6.25 x height (cm) – 5 x age (years) – 161
      //write function when all values are present and when height weight are not there
	  //pending: scenario when enough items are not there in calorie range
	  float bmr=0;
	  int caloriesbk=0;
	  int calorieslunch=0;
	  int caloriesdinner=0;
	  
	  List<MenuItems> list = new ArrayList<MenuItems>();
	  if(height>0 && weight>0){
		  
	  if(gender.equalsIgnoreCase("Female"))
	  {
		  bmr = (float)((10 * weight) +( 6.25 * height)-(5 * age)-161);
	  }
	  else
	  {
		  bmr = (float)((10 * weight) +( 6.25 * height)-(5 * age)+5);
	  }
	  calorieslunch=(int)(bmr*0.40);
	  caloriesbk=(int)(bmr*0.40);
	  caloriesdinner=(int)(bmr*0.2);
      String sqlbk = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Breakfast' and Calorie between ("+caloriesbk+"-20) and ("+caloriesbk+"+20)limit 7";
      System.out.println(caloriesbk+" - "+calorieslunch+" - "+caloriesdinner+"sql "+sqlbk);
      PreparedStatement pstm = conn.prepareStatement(sqlbk);
      ResultSet rs = pstm.executeQuery();
      
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
      String sqll = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Lunch' and Calorie between ("+calorieslunch+"-20) and ("+calorieslunch+"+20) limit 7";
      System.out.println("sql "+sqll);
       pstm = conn.prepareStatement(sqll);
       rs = pstm.executeQuery();
      
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
      String sqld = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Dinner' and Calorie between ("+caloriesdinner+"-20) and ("+caloriesdinner+"+20) limit 7";
      System.out.println("sql "+sqld);
       pstm = conn.prepareStatement(sqld);
       rs = pstm.executeQuery();
      
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
      }
	  else
	  {
		  String sqlbk = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Breakfast' limit 7";
	      System.out.println("sql "+sqlbk);
	      PreparedStatement pstm = conn.prepareStatement(sqlbk);
	      ResultSet rs = pstm.executeQuery();
	      
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
	      String sqll = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Lunch' limit 7";
	      System.out.println("sql "+sqll);
	       pstm = conn.prepareStatement(sqll);
	       rs = pstm.executeQuery();
	      
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
	      String sqld = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Dinner' limit 7";
	      System.out.println("sql "+sqld);
	       pstm = conn.prepareStatement(sqld);
	       rs = pstm.executeQuery();
	      
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
	  }
      return list;
  }
  
  //need to handle update in case if customer record is already available and in case if active order is present then deactivate the previous one
  public static int insertRecord(Connection conn,int preference, int height, int weight, String gender, int age,String name, String phone, String email,String address,String state,String city,String zip,
		  ArrayList bkitems,ArrayList litems,ArrayList ditems, int planId) throws SQLException {
	  
		  int inserted=0;
		  int cust_id=0;
		  int order_id=0;
		  String dayString="";
		  try{
	      conn.setAutoCommit(false);
		 
		  // create a Statement from the connection
		  Statement statement = conn.createStatement();
		  System.out.println(email);
		  // insert the data
		  inserted=statement.executeUpdate("INSERT INTO happytummy.customerdetails(Customer_Name,Email_Id,DOB,Age,Gender,Height,Weight,Address,Phone,Zip,Payment,City,State)VALUES('"+name+"','"+email+"','1987-11-12',"+age+",'"+gender+"',"+height+","+weight+",'"+address+"','"+phone+"','"+zip+"','Paypal','"+city+"','"+state+"')");
		  System.out.println("inserted in customer "+inserted);
		  ResultSet cust_id_rs=statement.executeQuery("select customer_id from happytummy.customerdetails where Email_Id='"+email+"'");
		  while(cust_id_rs.next())
		  {
			  cust_id=cust_id_rs.getInt(1);
		  }
		  String sql_orderids="INSERT INTO happytummy.order_ids(Order_date,Customer_ID,Plan_ID,Active)VALUES(curdate(),"+cust_id+","+planId+",'A')";
		  System.out.println(sql_orderids+"inserted in order_ids");
		  inserted=statement.executeUpdate(sql_orderids);
		  
		  ResultSet order_rs=statement.executeQuery("select Order_ID from happytummy.order_ids where Customer_ID="+cust_id +" and Active='A'");
		  while(order_rs.next())
		  {
			  order_id=order_rs.getInt(1);
		  } 
		  int bkitem=1; //change it to 0 once items are inserted
		  int litem=1;
		  int ditem=1;
		  for(int i=0;i<7;i++)
		  {
			  switch (i) {
	            case 1:  dayString = "Monday";
	                     break;
	            case 2:  dayString = "Tuesday";
	                     break;
	            case 3:  dayString = "Wednesday";
	                     break;
	            case 4:  dayString = "Thursday";
	                     break;
	            case 5:  dayString = "Friday";
	                     break;
	            case 6:  dayString = "Saturday";
	                     break;
	            case 0:  dayString = "Sunday";
	                     break;
			  }
			  System.out.println(""+bkitems.size()+""+litems.size()+""+ditems.size());
			  if(bkitems.size()>=(i+1))
			  {
			
			  bkitem=Integer.parseInt(bkitems.get(i).toString());
			  }
			  else
			  {
				  bkitem=1;
			  }
			  if(litems.size()>=(i+1))
			  {
			 
			  litem=Integer.parseInt(litems.get(i).toString());
			  }
			  else
			  {
				  litem=1;
			  }
			  if(ditems.size()>=(i+1))
			  {
			  ditem=Integer.parseInt(ditems.get(i).toString());
			  }
			  else
			  {
				  ditem=1;
			  }
		  
		  inserted=statement.executeUpdate("INSERT INTO happytummy.order_details  (Day,Breakfast,Lunch,Dinner,Order_Id) VALUES ('"+dayString+"',"+bkitem+","+litem+","+ditem+","+order_id+")");
		  
		  }
		  }
		  catch(SQLException sqle)
		  {
			  sqle.printStackTrace();
			  conn.rollback();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
			  conn.rollback();
		  }
		  finally
		  {
			  conn.commit();
		  }
		  return inserted;
	
	  }
}