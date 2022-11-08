public class DOGApi {
    public static HttpResponse getRandomBreed(String totalDogs) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dog.ceo/api/breeds/image/random/'+totalDogs);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        List<Lead> lds = new List<Lead>();
       if(response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
            List<object> image = (List<object>)results.get('message');
            for(Object images : image){
                Lead le = new lead();
                le.LastName = 'Doggie'+string.valueof(image.indexof(images));
                le.Company = 'c company';
                le.URL__c=string.valueof(images);
                lds.add(le);
            }
        }
        insert lds;
        System.debug(lds);
        return response;
    }
}