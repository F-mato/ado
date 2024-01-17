import java.util.List;
import java.util.stream.Collectors;

public class ReservationData {
	List<ReserveHistory> reserveHistory;

	ReservationData(List<ReserveHistory> reserveHistory) {
		this.reserveHistory = reserveHistory;
	}

	public String toJson() {
		String historyJson = reserveHistory.stream()
				.map(ReserveHistory::toJson)
				.collect(Collectors.joining(","));

		return "{\"reserveHistory\":[" + historyJson + "]}";
	}
}
