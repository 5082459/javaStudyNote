import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        System.out.println("======================");
        int[] array = {1,2,3,6,5,4,2,50,1,3,2,11,1,1};
        // sort(a);
        // selectionSort(array);
        insertSort(array);
        System.out.println(Arrays.toString(array));

    }
    // 冒泡排序
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

    //  选择排序
     public static void selectionSort(int[] array){
        int length = array.length;
        int out,in,buff;
        for (out = 0;out < length - 1; out ++){
            for(in = out + 1;in < length; in ++){
                if(array[in] < array[out]){
                    buff = array[in];
                    array[in] = array[out];
                    array[out] = buff;
                }
            }
        }
    }

    // 插入排序
    public static void insertSort(int[] array){
        int length = array.length;
        int out,in,temp;
        for(out = 1;out < length ; out ++){
            temp = array[out]; 
            in = out;       
            while(in > 0 && array[in - 1] > temp){
                array[in] = array[in - 1];
                in --;
            }
            array[in] = temp;
        }
    }
}
