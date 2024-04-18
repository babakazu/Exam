package bean;

public class Student {
    private int enrollmentYear;
    private int studentNumber;
    private String name;
    private String className;
    private boolean enrolled;

    public Student() {
        // デフォルトコンストラクタ
    }

    public Student(int enrollmentYear, int studentNumber, String name, String className, boolean enrolled) {
        this.enrollmentYear = enrollmentYear;
        this.studentNumber = studentNumber;
        this.name = name;
        this.className = className;
        this.enrolled = enrolled;
    }

    public int getEnrollmentYear() {
        return enrollmentYear;
    }

    public void setEnrollmentYear(int enrollmentYear) {
        this.enrollmentYear = enrollmentYear;
    }

    public int getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(int studentNumber) {
        this.studentNumber = studentNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public boolean isEnrolled() {
        return enrolled;
    }

    public void setEnrolled(boolean enrolled) {
        this.enrolled = enrolled;
    }
}