public class DesignPattern {
    public static void Pattern1() {
        for(integer i=1;i<=5;i++){
            string s='';
            for(integer j=1;j<=5;j++){
                if(j<=i){
                    s+='x';
                }
            }
            system.debug(s);
        }
    }
    public static void Pattern2(){
        for(integer i=1;i<=6;i++){
            string s='';
            for(integer j=1;j<=6;j++){
                if(j<=i){
                    s+='x';
                }
            }
            system.debug(s);
        }
    }
}
//DesignPattern.Pattern1();
//DesignPattern.Pattern2();