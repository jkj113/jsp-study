package test.jsp.study.test;

public class Array02 {
public static void main(String[] args) {
	int[] arr = {5,1,4,3,7};
	
	for(int i = 0; i<arr.length-1;i++) {
		for(int j = 0; j<arr.length-1-i;j++) {
			if(arr[j]>arr[j+1]) {
				int tmp = arr[j];
				arr[i] = arr[j+1];
				arr[j+1] = tmp;
			}
		}
	}
}
}
