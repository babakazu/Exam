package bean;
public class Teacher {
    private String id;
    private String password;
    private String name;
    private String schoolCd;

    // コンストラクタ
    public Teacher() {
        // デフォルトのコンストラクタ
    }

    public Teacher(String id, String password, String name, String schoolCd) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.schoolCd = schoolCd;
    }

    // ゲッターとセッター
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSchoolCd() {
        return schoolCd;
    }

    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }
}
