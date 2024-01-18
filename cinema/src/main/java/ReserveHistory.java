
public class ReserveHistory {
	int reserveId;
	String title;
	String seat;
	String date;
	String time;
	String total;
	String freewrite;
	//コンストラクター
	ReserveHistory(int reserveId, String title, String seat, String date, String time, String total, String freewrite) {
		this.reserveId = reserveId;
		this.title = title;
		this.seat = seat;
		this.date = date;
		this.time = time;
		this.total = total;
		this.freewrite = freewrite;
	}

	public String toJson() {
		return "{"
				+ "\"reserveId\":" + reserveId + ","
				+ "\"title\":\"" + title + "\","
				+ "\"seat\":\"" + seat + "\","
				+ "\"date\":\"" + date + "\","
				+ "\"time\":\"" + time + "\","
				+ "\"total\":\"" + total + "\","
				+ "\"freewrite\":\"" + freewrite + "\""
				+ "}";
	}
}
