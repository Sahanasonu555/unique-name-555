public class DogImageRestApi {
    public static HttpResponse createDogLead() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dog.ceo/api/breeds/image/random');
        request.setMethod('GET');
        Map<String, Object> lead= new Map<String,Object>();
        HttpResponse response = http.send(request);
      if(response.getStatusCode() == 200) {
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           Map<String,String> mapLeads =(Map<String,String>) JSON.Deserialize(response.getBody(),Map<String,String>.class);
           System.debug(mapLeads);
           List<Lead> lds = new List<Lead>();
           Lead le = new lead();
               le.URL__c = String.valueof(mapLeads.get('message'));
               le.LastName = 'Dog01';
               le.Company = 'c company';
               lds.add(le);
          
           insert lds;
           System.debug(lds);
        }
        return response;
    }
}