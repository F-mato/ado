
public class Movie {
	int screenId;
	String title;
	String description;
	String imgpath;
	//コンストラクター
	Movie(int screenId, String title, String description, String imgpath) {
		this.screenId = screenId;
		this.title = title;
		this.description = description;
		this.imgpath = imgpath;
	}

	public String toJson() {
		return "{"
				+ "\"screenId\":" + screenId + ","   
				+ "\"title\":\"" + title + "\","
				+ "\"description\":\"" + description + "\"," 
				//+ "\"imgpath\":\"" + imgpath.replace("\\", "\\\\") + "\"" 
				+ "\"imgpath\":\"" + replace(imgpath) + "\"" 
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
