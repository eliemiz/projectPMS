package pms.z02_util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.stereotype.Controller;

@Controller
public class TimeManager {
	
	private static SimpleDateFormat isoFormat;
	SimpleDateFormat ganttFormat;
	
	/* Singleton */
	private static class LazyHolder {
		public static final TimeManager INSTANCE = new TimeManager();
	}
	
	private TimeManager() {
		isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		isoFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
		ganttFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
	}

	public static TimeManager getInstance() {
		return LazyHolder.INSTANCE;
	}
	
	public String isoToGantt(String date) {
		
		String ganttDate = null;
		
		try {
			Date isoDate = isoFormat.parse(date);
			ganttDate = ganttFormat.format(isoDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ganttDate;
	}

}