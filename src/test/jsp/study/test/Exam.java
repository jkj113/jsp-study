package test.jsp.study.test;

public class Exam {
	public static void main(String[] args) {
		for (int i = 1; i <= 100; i++) {
//		if(i%10==3 || i%6==0 || i%9==0) {
//			System.out.print("짝" +",");
//		}else {
//			System.out.print(i +",");
//		}
			String numStr = i + "";
			numStr = numStr.substring(numStr.length() - 1);
			int num = Integer.parseInt(numStr);
			if (num != 0 && num % 3 == 0) {
				System.out.print("짝!" + ",");
			} else {
				System.out.print(i + ",");
			}
           if(i%10==0) {
        	   System.out.println();
           }
		}
	}
}
