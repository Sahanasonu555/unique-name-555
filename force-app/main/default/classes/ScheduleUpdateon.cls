public class ScheduleUpdateon implements Schedulable {
    public void execute(SchedulableContext ctx) {
      BatchLeadQuality b = new BatchLeadQuality();
        String sch = '00 00 9 13 5 2022';
      database.executebatch(b);
    }
}