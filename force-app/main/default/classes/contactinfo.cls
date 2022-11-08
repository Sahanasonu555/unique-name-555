public with sharing class contactinfo {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT Name
            FROM Contact
            ORDER BY Name ASC
        ];
    }
}