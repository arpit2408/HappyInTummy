package happytummy.connect;

import java.util.Locale;
import java.util.ResourceBundle;

public class PropertyReader {

		private static ResourceBundle bundle = null;
		/**
		 * Property Reader
		 *
		 */
		public PropertyReader() {
		}

		static {
			loadConfiguration();
		}
		/**
		 * Get
		 *
		 * @param param_s_key
		 * @return
		 */
		public static String getValue(String param_s_key) {
			if (param_s_key == null || param_s_key.trim().length() <= 0) {
				return null;
			};
			return bundle.getString(param_s_key.trim());
		}
		private static void loadConfiguration() {
			bundle =
				ResourceBundle.getBundle("happytummy.connect.application", Locale.ENGLISH);
		}

	}

