package bean;

public class Student {
    private String no;
    private String name;
    private String ent_year;
    private String class_num;
    private String is_attend;
    private String school_cd;

    public Student() {
        // デフォルトコンストラクタ
    }

    public Student(String no, String name , String ent_year , String class_num , String is_attend , String school_cd) {
        this.no = no;
        this.name = name;
        this.ent_year = ent_year;
        this.class_num = class_num;
        this.is_attend = is_attend;
        this.school_cd = school_cd;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEnt_year() {
        return ent_year;
    }

    public void setEnt_year(String ent_year) {
        this.ent_year = ent_year;
    }

    public String getClass_num() {
        return class_num;
    }

    public void setClass_num(String class_num) {
        this.class_num = class_num;
    }

    public String getIs_attend() {
        return is_attend;
    }

    public void setIs_attend(String is_attend) {
        this.is_attend = is_attend;
    }

    public String getSchool_cd() {
        return school_cd;
    }

    public void setSchool_cd(String school_cd) {
        this.school_cd = school_cd;
    }
}