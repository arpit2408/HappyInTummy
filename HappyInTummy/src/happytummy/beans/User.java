package happytummy.beans;

public class User {
	private int customer_id;
	private String customer_name;
	private String email_id;
	private String birth_date;
	private String gender;
	private int height;
	private int weight;
	private String address;
	private String city;
	private String state;
	private int postal_zip;
	private String phone_number;
	private String payment_mode;
	private String preference;
	private String noOfWeeks;
	private String orderNumber;
	
	//getter methods
	public int getCustomer_id(){
		return customer_id;
	}
	public String getCustomer_name(){
		return customer_name;
	}
	public String getEmail_id(){
		return email_id;
	}
	public String getBirth_date(){
		return birth_date;
	}
	public String getGender(){
		return gender;
	}
	public int getHeight(){
		return height;
	}
	public int getWeight(){
		return weight;
	}
	public String getAddress(){
		return address;
	}
	public String getCity(){
		return city;
	}
	public String getState(){
		return state;
	}
	public int getPostal_zip(){
		return postal_zip;
	}
	public String getPhone_number(){
		return phone_number;
	}	
	public String getPayment_mode(){
		return payment_mode;
	}
	public String getPreference(){
		return preference;
	}
	public String getNoOfWeeks(){
		return noOfWeeks;
	}
	public String getOrderNumber(){
		return orderNumber;
	}
	// setter methods	
		public void setCustomer_id(int customer_id){
			this.customer_id= customer_id;
		}
		public  void setCustomer_name(String customer_name){
			this.customer_name= customer_name;
		}
		public void setEmail_id(String email_id){
			this.email_id=email_id;
		}
		public void setBirth_date(String birth_date){
			this.birth_date=birth_date;;
		}
		public void  setGender(String gender){
			this.gender= gender;
		}
		public void setHeight(int height){
			this.height= height;
		}
		public void setWeight(int weight){
			this.weight= weight;
		}
		public void setAddress(String address){
			this.address= address;
		}
		public void setCity(String city){
			this.city= city;
		}
		public void setState(String state){
			this.state=state;
		}
		public void setPostal_zip(int postal_zip){
			this.postal_zip= postal_zip;
		}
		public void setPhone_number(String phone_number){
			this.phone_number= phone_number;
		}	
		public void setPayment_mode(String payment_mode){
			this.payment_mode= payment_mode;
		}
		public void setPreference(String preference){
			this.preference=preference;
		}
		public void setNoOfWeeks(String noOfWeeks){
			this.noOfWeeks=noOfWeeks;
		}
		public void setOrderNumber(String orderNumber){
			this.orderNumber=orderNumber;
		}		
}
