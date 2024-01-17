
public class ReserveHistory {
	int reserveId;
	String seat;
	String date;
	//コンストラクター
	ReserveHistory(int reserveId, String seat, String date) {
		this.reserveId = reserveId;
		this.seat = seat;
		this.date = date;
	}

	public String toJson() {
		return "{"
				+ "\"reserveId\":" + reserveId + ","
				+ "\"seat\":\"" + seat + "\","
				+ "\"date\":\"" + date + "\""
				+ "}";
	}
}
