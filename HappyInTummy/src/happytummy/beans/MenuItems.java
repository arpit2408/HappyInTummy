package happytummy.beans;

public class MenuItems {

	 	private int item_id;	   
	 	private String item_Name;
		private String item_Desc;
		private int calorie;
		private int proteins;
		private int fats;
		private int carbohydrates;
	
		private int preference_ID;
		   
		private String image_Name;
		private String meal_Type;
		public String getMeal_Type() {
			return meal_Type;
		}
		public void setMeal_Type(String meal_Type) {
			this.meal_Type = meal_Type;
		}
		public String getImage_Name() {
			return image_Name;
		}
		public void setImage_Name(String image_Name) {
			this.image_Name = image_Name;
		}
		public int getItem_id() {
			return item_id;
		}
		public void setItem_id(int item_id) {
			this.item_id = item_id;
		}
		public String getItem_Name() {
			return item_Name;
		}
		public void setItem_Name(String item_Name) {
			this.item_Name = item_Name;
		}
		public String getItem_Desc() {
			return item_Desc;
		}
		public void setItem_Desc(String item_Desc) {
			this.item_Desc = item_Desc;
		}
		public int getCalorie() {
			return calorie;
		}
		public void setCalorie(int calorie) {
			this.calorie = calorie;
		}
		public int getProteins() {
			return proteins;
		}
		public void setProteins(int proteins) {
			this.proteins = proteins;
		}
		public int getFats() {
			return fats;
		}
		public void setFats(int fats) {
			this.fats = fats;
		}
		public int getCarbohydrates() {
			return carbohydrates;
		}
		public void setCarbohydrates(int carbohydrates) {
			this.carbohydrates = carbohydrates;
		}
		
		public int getPreference_ID() {
			return preference_ID;
		}
		public void setPreference_ID(int preference_ID) {
			this.preference_ID = preference_ID;
		}
		
		  
		 
}
