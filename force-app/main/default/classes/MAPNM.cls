@isTest
public class MAPNM {
    @isTest
    public static void lidTest(){
        Map<String,String> Con = new Map<String,String>();
        for(LEAD ldj:[Select Id,Country,Name from lead Limit 10]){
            Con.put('India','Sham');
        Con.put(ldj.Country,ldj.Name);
        }
        String Lnm=Con.get('India');
        System.debug(Con);
    }
}