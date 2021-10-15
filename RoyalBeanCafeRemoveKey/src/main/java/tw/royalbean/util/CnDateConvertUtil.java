package tw.royalbean.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CnDateConvertUtil {
	
	private CnDateConvertUtil(){
		
	}
	 
    private static final String [] CN_DATE_STR = new String[]{"年","月","日","时","分","秒"};
 
    private static final  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 
    private static final String CN_TEN_STR = "十";
 
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");
    
    public  static String dateToCnDate(Date localDateTime) {
      
    	return sdf.format(localDateTime);
    
    }
    
    public  static String dateToOrder(Date localDateTime) {
        
    	return dateFormat.format(localDateTime);
    
    }

}
