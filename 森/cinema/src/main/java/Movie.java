
public class Movie {
	int screenId;
	String title;
	String description;
	String imgpath;
	String moviepath;
	String time1;
	String time2;
	String time3;
	String time4;
	String time5;
	String time6;
	//コンストラクター
	Movie(int screenId, String title, String description, String imgpath, String moviepath, String time1, String time2, String time3, String time4, String time5, String time6) {
		this.screenId = screenId;
		this.title = title;
		this.description = description;
		this.imgpath = imgpath;
		this.moviepath = moviepath;
		this.time1 = time1;
		this.time2 = time2;
		this.time3 = time3;
		this.time4 = time4;
		this.time5 = time5;
		this.time6 = time6;
	}

	public String toJson() {
		return "{"
				+ "\"screenId\":" + screenId + ","   
				+ "\"title\":\"" + title + "\","
				+ "\"description\":\"" + description + "\"," 
				//+ "\"imgpath\":\"" + imgpath.replace("\\", "\\\\") + "\"" 
				+ "\"imgpath\":\"" + replace(imgpath) + "\"," 
				+ "\"moviepath\":\"" + replace(moviepath) + "\"," 
				+ "\"time1\":\"" + time1 + "\"," 
				+ "\"time2\":\"" + time2 + "\"," 
				+ "\"time3\":\"" + time3 + "\"," 
				+ "\"time4\":\"" + time4 + "\"," 
				+ "\"time5\":\"" + time5 + "\"," 
				+ "\"time6\":\"" + time6 + "\"" 
				+ "}";
	}
	
	public String replace(String path) {
		if ( path == null) {
			return "";
		}
		if(path.contains("\\")) {
			return path.replace("\\", "\\\\");
			
		}
		else {
			return path;
		}
	}
}
