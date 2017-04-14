package happytummy.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
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

  //Method to get plans based on preference
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
	  
	  float bmr=0;
	  int caloriesbk=0;
	  int calorieslunch=0;
	  int caloriesdinner=0;
	  boolean defaultmenu=false;
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
	  calorieslunch=(int)(bmr*0.35);
	  caloriesbk=(int)(bmr*0.30);
	  caloriesdinner=(int)(bmr*0.35);
      String sqlbk = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Breakfast' and Calorie between ("+caloriesbk+"-20) and ("+caloriesbk+"+20) limit 7";
      System.out.println(caloriesbk+" - "+calorieslunch+" - "+caloriesdinner);
      PreparedStatement pstm = conn.prepareStatement(sqlbk);
      ResultSet rs = pstm.executeQuery();
      int countbk=0;
      String items="";
      while (rs.next()) {
    	  countbk=countbk+1;
    	  int item_ID = rs.getInt("Item_ID");
          String item_Name = rs.getString("Item_Name");
          items="'"+item_Name+"',"+items;
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
      if (items != null && items.length() > 0) {
    	  items = items.substring(0, items.length()-1);
        }
     
      if(countbk<7 && countbk>0)
      {
    	   sqlbk = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Breakfast' and  portion=2 and item_name not in ("+items+") limit "+(7-countbk);
        
           pstm = conn.prepareStatement(sqlbk);
           rs = pstm.executeQuery();
         
          while (rs.next()) {
        	  
        	  int item_ID = rs.getInt("Item_ID");
        	  System.out.println("less than 7 case item_ID "+item_ID);
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
      String sqll = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Lunch' and Calorie between ("+calorieslunch+"-20) and ("+calorieslunch+"+20) limit 7";
      System.out.println("sql "+sqll);
       pstm = conn.prepareStatement(sqll);
       rs = pstm.executeQuery();
      int countlunch=0;
      items="";
      while (rs.next()) {
    	  countlunch=countlunch+1;
    	  int item_ID = rs.getInt("Item_ID");
    	 
          String item_Name = rs.getString("Item_Name");
          items="'"+item_Name+"',"+items;
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
      
      if (items != null && items.length() > 0) {
    	  items = items.substring(0, items.length()-1);
        }
      
      if(countlunch<7 && countlunch>0)
      {
    	   sqll = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Lunch' and  portion=2 and item_name not in ("+items+") limit "+(7-countlunch);
        
           pstm = conn.prepareStatement(sqll);
           rs = pstm.executeQuery();
         
          while (rs.next()) {
        	  
        	  int item_ID = rs.getInt("Item_ID");
        	  System.out.println("less than 7 case item_ID "+item_ID);
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
      
      String sqld = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Dinner' and Calorie between ("+caloriesdinner+"-20) and ("+caloriesdinner+"+20) limit 7";
     
       pstm = conn.prepareStatement(sqld);
       rs = pstm.executeQuery();
      int countd=0;
      items="";
      while (rs.next()) {
    	  countd=countd+1;
    	  int item_ID = rs.getInt("Item_ID");
    	  System.out.println("item_ID "+item_ID);
          String item_Name = rs.getString("Item_Name");
          items="'"+item_Name+"',"+items;
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
      
      
      if (items != null && items.length() > 0) {
    	  items = items.substring(0, items.length()-1);
        }
      
      if(countd<7 && countd>0)
      {
    	  sqld = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and Meal_Type='Dinner' and  portion=2 and item_name not in ("+items+") limit "+(7-countd);
        
           pstm = conn.prepareStatement(sqld);
           rs = pstm.executeQuery();
         
          while (rs.next()) {
        	  
        	  int item_ID = rs.getInt("Item_ID");
        	  System.out.println("less than 7 case item_ID "+item_ID);
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
      if(countbk==0 || countd==0 || countlunch==0)
      {
    	  defaultmenu=true;
      }
      }
	  
	  else //When height and weight are not given, show predefined menu
	  {
		  defaultmenu=true;  
	  }
	  if(defaultmenu==true)
	  {
		  list = new ArrayList<MenuItems>();
		  String sqlbk = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and portion=1 and Meal_Type='Breakfast' limit 7";
	      
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
	      String sqll = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and portion=1  and Meal_Type='Lunch' limit 7";
	      
	       pstm = conn.prepareStatement(sqll);
	       rs = pstm.executeQuery();
	      
	      while (rs.next()) {
	    	  int item_ID = rs.getInt("Item_ID");
	    	
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
	      String sqld = "select Item_ID, Item_Name,Item_Desc,Calorie,Proteins,Fats,Carbohydrates,Image_Name,Meal_Type from happytummy.fooditems where Preference_ID="+preference +" and portion=1  and Meal_Type='Dinner' limit 7";
	      
	       pstm = conn.prepareStatement(sqld);
	       rs = pstm.executeQuery();
	      
	      while (rs.next()) {
	    	  int item_ID = rs.getInt("Item_ID");
	    	 
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
  
  //Method to insert allocated menu and customer details in database
  public static int insertRecord(Connection conn,int preference, int height, int weight, String gender, int age,String name, String phone, String email,String address,String state,String city,String zip,
		  ArrayList bkitems,ArrayList litems,ArrayList ditems, int planId, Date birthDate,String payment) throws SQLException {
	  
		  int inserted=0;
		  int cust_id=0;
		  int order_id=0;
		  String dayString="";
		  int updated=0;
		  try{
	      conn.setAutoCommit(false);
		 
		  // create a Statement from the connection
		  Statement statement = conn.createStatement();
		  java.sql.Date sqlDate = new java.sql.Date(birthDate.getTime()); 
		  ResultSet checkExistingEntry=statement.executeQuery("select customer_id from happytummy.customerdetails where Email_Id='"+email+"' and DOB='"+sqlDate+"'");
		  while(checkExistingEntry.next())
		  {
			  cust_id=checkExistingEntry.getInt(1);
		  }
		  if(cust_id==0)
		  {
	
		  inserted=statement.executeUpdate("INSERT INTO happytummy.customerdetails(Customer_Name,Email_Id,DOB,Age,Gender,Height,Weight,Address,Phone,Zip,Payment,City,State)VALUES('"+name+"','"+email+"','"+sqlDate+"',"+age+",'"+gender+"',"+height+","+weight+",'"+address+"','"+phone+"','"+zip+"','"+payment+"','"+city+"','"+state+"')");
		  System.out.println("inserted in customer "+inserted);
		  
		  ResultSet cust_id_rs=statement.executeQuery("select customer_id from happytummy.customerdetails where Email_Id='"+email+"'");
		  while(cust_id_rs.next())
		  {
			  cust_id=cust_id_rs.getInt(1);
		  }
		  }
		  else
		  {
			  String updateCustomer="UPDATE happytummy.customerdetails"+
				" SET  customer_Name = '"+ name+"',  Age = "+age+",Gender = '"+gender+"',"+
				" Height = "+ height+", Weight = "+ weight+",Address = '"+address+"', Phone ='"+phone +"',"+
				" Zip = "+Integer.parseInt(zip)+", Payment ='"+payment+"',city = '"+city+"', State = '"+state+"'"+
				" WHERE Customer_ID =  "+cust_id;
			  System.out.println(updateCustomer+"updated in order_ids");
			  updated=statement.executeUpdate(updateCustomer);
			  //set previous order as inactive
			  String updateOrder="UPDATE happytummy.order_ids"+
						" SET  Active='I'"+
						" WHERE Customer_ID =  "+cust_id;
					  System.out.println(updateOrder+" in updateOrder");
					  updated=statement.executeUpdate(updateOrder);
			   
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
		  return order_id;
	
	  }
}