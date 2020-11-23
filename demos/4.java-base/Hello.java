public class Hello {
    public static void main(String[] aaa) {
          System.out.println("我要打印参数了\n");
          for (int i = 0; i < aaa.length; i++) {
               System.out.println(i + " : " + aaa[i]);
          }
          System.out.println("打印结束. 总共打印了 " + aaa.length + " 个参数");
    }
}