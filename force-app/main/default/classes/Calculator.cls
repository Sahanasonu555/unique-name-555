public class Calculator {
    public static Integer add(){
       Integer a=5;
       Integer b=8;
       Integer c=a+b;
        System.debug(c);
        return c;
    }
   // Calculator.add();
    public static Integer sub(){
       Integer x=10;
       Integer y=5;
       Integer z=x-y;
        System.debug(z);
        return z;
    }
    //Calculator.sub();
   
    public static Integer multiplication(){
       Integer d=5;
       Integer e=8;
       Integer f=d*e;
        System.debug(f);
        return f;
    }
   // Calculator.mul();
   
    public static Integer findRemainder(){
       Integer g=3;
       Integer h=2;
       Integer i=Math.Mod(g,h);
        System.debug(i);
        return i;
    }
   // Calculator.findRemainder();
    public static Integer doOperations( Integer U,Integer V ,String stringvalue){
        Integer W = 0;
        if (stringvalue == 'add'){
            W = U+V;
        }
        if (stringvalue == 'sub'){
            W = U-V;
        }
        if (stringvalue == 'multiply'){
            W = U*V;
        }
        if (stringvalue == 'remainder'){
            W = Math.Mod(U,V);
        }
        system.debug(W);
        Return W;
    }
   // Calculator.doOperations(5,10,'add');
}