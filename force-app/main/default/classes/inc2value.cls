public with sharing class inc2value {
    @AuraEnabled
    public static void incvalue( Integer j){
        try {
            Integer i;
        for(i=0;i<j;i++){
            i=i+2;
            System.debug(i);
        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}