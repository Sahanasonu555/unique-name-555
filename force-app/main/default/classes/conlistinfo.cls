public with sharing class conlistinfo {
        @AuraEnabled(cacheable=true)
        public static List<Contact> getContactslist() {
            return [
                SELECT Name
                FROM Contact
                ORDER BY Name ASC Limit 10
            ];
        }
    }