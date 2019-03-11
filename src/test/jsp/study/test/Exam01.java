package test.jsp.study.test;

public class Exam01 {
    int a;
    String str;
	int getInt() {
		return 1;
	}
	void getInt(String str) {
		return;
	}
	Exam01 getExam01() {
		this.a = 3;
		this.str = "abc";
		return null;
//		return this;
	}
public static void main(String[] args) {
	Exam01 e = new Exam01();
	System.out.println(e.a);
//	Exam01 x = new Exam01().getExam01();
//	System.out.println(x.a);
	
//	System.out.println(e.str); //=>null 정해져 있지 않으므로
//	int a = e.getInt();
//    int b = 1;
//    e.getInt("abc"); //데이터 타입이 void이므로 어디에 저장 할 수 없다. method에도 데이터 타입을 선언 할 수 있다.
//	
//    Object o =null;
//    String str = null;
//    Exam01 e2 = null; //모든 정해져 있지 않은 데이터 타입은 싹 다 null로 할 수  있다.
}
}
