package bean;

public class Test {
    private String student_No;
    private String subject_Cd;
    private String school_Cd;
    private int no;
    private int point;
    private String class_Num;
    private String ent_year;
    private String name;

    public String getStudent_No() {
        return student_No;
    }

    public void setStudent_No(String student_No) {
        this.student_No = student_No;
    }

    public String getSubject_Cd() {
        return subject_Cd;
    }

    public void setSubject_Cd(String subject_Cd) {
        this.subject_Cd = subject_Cd;
    }

    public String getSchool_Cd() {
        return school_Cd;
    }

    public void setSchool_Cd(String school_Cd) {
        this.school_Cd = school_Cd;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getClass_Num() {
        return class_Num;
    }

    public void setClass_Num(String class_Num) {
        this.class_Num = class_Num;
    }

public String getEnt_year() {
    return ent_year;
}

public void setEnt_year(String ent_year) {
    this.ent_year = ent_year;
}
public void setNo(String no) {
    this.no = Integer.parseInt(no); // Stringをintに変換して設定
}

// 既存のメソッドと同じ名前だが引数が異なる新しいメソッドを追加
public void setName(String name) {
    this.name = name;
}

// 既存のメソッドと同じ名前だが引数が異なる新しいメソッドを追加
public String getName() {
    return name;
}
}