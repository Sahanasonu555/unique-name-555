public class LeadCreateAPI {
    public static HttpResponse createLead(String Name) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.agify.io/?name='+Name);
        request.setMethod('GET');
        Map<String, Object> lead= new Map<String,Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,String> mapLeads =(Map<String,String>) JSON.Deserialize(response.getBody(),Map<String,String>.class);
            System.debug(mapLeads);
            List<Lead> lds = new List<Lead>();
            Lead le = new lead();
            if(mapLeads.containsKey('name')){
                le.FirstName = String.valueof(mapLeads.get('name'));
                le.LastName = 'L';
                le.Age__c = 14;
                le.Company = 'c company';
                lds.add(le);
            }
            insert lds;
            System.debug(lds);
        }
        return response;
    }
}