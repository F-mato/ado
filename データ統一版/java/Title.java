public class Title {
    private int titleId;
    private String titleName;

    public Title(int titleId, String titleName) {
        this.titleId = titleId;
        this.titleName = titleName;
    }

    public int getTitleId() {
        return titleId;
    }

    public String getTitleName() {
        return titleName;
    }
}