public class Reversedigit {
public Integer PrintReverseOrder()
{
    Integer i;
    Integer N = 100;
    for (i = N; i > 0; i--){
        System.debug( i + '');
    }
    return N;
}
    public Integer DivideThree()
    {
 
        Integer x = 100;
        Integer y = 3;
        for(x =100;x > 0;x--){
             // Integer t=x/y;
              Integer u = Math.Mod(x,y);
            If(u==2){
                System.debug(x);
            }
        }
        return x;
    }
}