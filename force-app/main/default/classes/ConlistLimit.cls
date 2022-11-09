public with sharing class ConlistLimit {
    @AuraEnabled(cacheable=true)
    public static List<Contact> GetConlists() {
                List<Contact> conList = [
                    SELECT Name
                    FROM Contact
                    ORDER BY Name ASC Limit 10
                ];
                return conList;
            }
        }