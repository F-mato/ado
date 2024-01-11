
public class ReserveHistory {
	int reserveId;
	String seats;
	String date;
	//コンストラクター
	ReserveHistory(int reserveId, String seats, String date) {
		this.reserveId = reserveId;
		this.seats = seats;
		this.date = date;
	}

	public String toJson() {
		return "{"
				+ "\"reserveId\":" + reserveId + ","
				+ "\"seats\":\"" + seats + "\","
				+ "\"date\":\"" + date + "\""
				+ "}";
	}
}
