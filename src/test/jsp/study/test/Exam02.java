package test.jsp.study.test;

class Dog { // 하나의 틀(3~5)
	String name;
}

public class Exam02 {
	Dog d; //=>null
	public Dog getDog() {
		if (d == null) {
//			return new Dog(); => null
			d = new Dog();
		}
//		return new Dog();
		return d;
	}
	public static void main(String[] args) {
		Exam02 e = new Exam02();
		Dog d = e.getDog();
		d.name = "퍼피"; // default라서
//		System.out.println(d.name);
		d = e.getDog();
		System.out.println(d.name);
	}
}
