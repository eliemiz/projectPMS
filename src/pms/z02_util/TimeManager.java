package pms.z02_util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;

@Controller
public class TimeManager {
	
	private static SimpleDateFormat isoFormat;
	private static SimpleDateFormat ganttFormat;
	private static SimpleDateFormat simpleFormat;
	private static SimpleDateFormat dateTimeFormat;
	
	/* Singleton */
	private static class LazyHolder {
		public static final TimeManager INSTANCE = new TimeManager();
	}
	
	private TimeManager() {
		isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		isoFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
		ganttFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}

	public static TimeManager getInstance() {
		return LazyHolder.INSTANCE;
	}
	
	/* 2021-04-19T15:00:00.000Z -> 2021-04-20 -> 20-04-2021 00:00 */
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
	
	/* 2021-04-19T15:00:00.000Z -> 2021-04-20 */
	public String isoToSimple(String date) {
		
		String simple = null;
		
		try {
			Date localDate = isoFormat.parse(date);
			simple = simpleFormat.format(localDate);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return simple;
	}
	
	/* 2021-04-20 -> 2021-04-19T15:00:00.000Z */
	public String simpleToIso(String date) {

		String iso = null;
		
		try {
			Date simple = simpleFormat.parse(date);
			iso = isoFormat.format(simple); 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return iso;
	}
	
	/* 2021-04-19T15:00:00.000Z -> Date ?????? */
	public Date isoToDate(String date) {
		
		Date simple = new Date();
		
		try {
			simple = simpleFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return simple;
	}
	
	public String dateToSimple(Date date) {
		return simpleFormat.format(date);
	}
	
	public String datetimeToSimple(String datetime) {
		try {
			Date dt = dateTimeFormat.parse(datetime);
			String date = simpleFormat.format(dt);
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	public String isoPlusDay(String date) {
		
		String iso = null;
		
		try {
			Date d = isoFormat.parse(date);
			d.setTime(d.getTime() + (1000 * 60 * 60 * 24));
			iso = isoFormat.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return iso;
	}
	
	public String isoPlusDay(String date, int day) {
		
		String iso = null;
		
		try {
			Date d = isoFormat.parse(date);
			d.setTime(d.getTime() + (1000 * 60 * 60 * 24 * day));
			iso = isoFormat.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return iso;
	}
	
public String isoMinusDay(String date) {
		
		String iso = null;
		
		try {
			Date d = isoFormat.parse(date);
			d.setTime(d.getTime() - (1000 * 60 * 60 * 24));
			iso = isoFormat.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return iso;
	}
	
}
