public with sharing class dogimageclick{
            @AuraEnabled(cacheable=true)
            public static string GetRandomDog(){
                String DogImage;
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndPoint('https://dog.ceo/api/breeds/image/random');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            Map<String,Object> results=(Map<String, Object>) JSON.deserializeUnTyped(response.getBody());
            DogImage = String.Valueof(results.get('message'));
            return DogImage;
            }
        }