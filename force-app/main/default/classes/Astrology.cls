public class Astrology {
    public Boolean isLeapYear(Integer year){
        Boolean isLeapYear;
        year=2000;
        IF(year!=year/4){
            isLeapYear=True;
        }
        else{
           isLeapYear=False; 
        }
        system.debug(isLeapYear);
       return isLeapYear;
    }
}

//Astrology LP = new Astrology();
//LP.isLeapYear(1996);