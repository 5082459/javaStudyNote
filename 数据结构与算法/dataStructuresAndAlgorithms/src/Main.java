import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        System.out.println("Hello World!");
        int[] a = {1,2,3,6,5,4,2,1,3,2,11,1,1};
        sort(a);
        System.out.println(Arrays.toString(a));

    }

    public static void sort(int[] array){
        int length = array.length;
        int num = length;
        int buff;
        for (int i = 0;i < length ; i++){   
            num --; 
            for(int j = 0;j < num ; j++){
                if (array[j] > array[j + 1]){
                    buff = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = buff; 
                }
            }
        }
     }
}
