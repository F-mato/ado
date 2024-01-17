//package Top_uso;

import java.util.Date;

public class MovieSet {
	private String title;
	private String poster;
	private String comment;
	private String time1;
	private String time2;
	private String time3;
	private String time4;
	private String time5;
	private String time6;
	private Date start;
	private Date end;
	
	
	public void MoveiSet(String title, String poster, String comment,
		String time1, String time2, String time3, String time4, String time5, String time6,
		Date start, Date end) {
			this.title = title;
			this.poster = poster;
			this.comment = comment;
			this.time1 = time1;
			this.time2 = time2;
			this.time3 = time3;
			this.time4 = time4;
			this.time5 = time5;
			this.time6 = time6;
			this.start = start;
			this.end = end;
	}
	

	public String getTitle() { return title; }
	public String getPoster() { return poster; }
	public String getComment() { return comment; }
	public String getTime1() { return time1; }
	public String getTime2() { return time2; }
	public String getTime3() { return time3; }
	public String getTime4() { return time4; }
	public String getTime5() { return time5; }
	public String getTime6() { return time6; }
	public Date getStart() { return start; }
	public Date getEnd() { return end; }

	
	public void setTitle(String title) { this.title = title; }
	public void setPoster(String poster) { this.poster = poster; }
	public void setComment(String comment) { this.comment = comment; }
	public void setTime1(String time1) { this.time1 = time1; }
	public void setTime2(String time2) { this.time1 = time2; }
	public void setTime3(String time3) { this.time1 = time3; }
	public void setTime4(String time4) { this.time1 = time4; }
	public void setTime5(String time5) { this.time5 = time5; }
	public void setTime6(String time6) { this.time6 = time6; }
	public void setStart(Date start) { this.start = start; }
	public void setEnd(Date end) { this.end = end; }

}
