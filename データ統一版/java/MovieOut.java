import java.util.List;
import java.util.stream.Collectors;

public class MovieOut {

	List<Movie> movies;

	MovieOut(List<Movie> moviesxxx) {
		this.movies = moviesxxx;
	}

	public String toJson() {
		String historyJson = this.movies.stream()
				.map(Movie::toJson)
				.collect(Collectors.joining(","));

		return "{\"movies\":[" + historyJson + "]}";
	}
}
