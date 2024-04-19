package bean;

public class Subject {
    private String schoolCode;
    private String code;
    private String name;

    // コンストラクタ、ゲッター、セッター
    public Subject() {}

    public Subject(String schoolCode, String code, String name) {
        this.schoolCode = schoolCode;
        this.code = code;
        this.name = name;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
