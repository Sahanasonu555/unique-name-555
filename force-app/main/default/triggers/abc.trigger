trigger abc on Opportunity (before insert) {
    Set<String> lastNames = new Set<String>();
    System.debug('lastNames');
        lastNames.add('Anusha Shetty');
        lastNames.add('Chummi GU');
        lastNames.add('Kiran M');
        lastNames.add('Usha M');
        lastNames.add('Sharva Reddy');
        lastNames.add('Anusha Shetty');
        lastNames.add('Monith Rao');
        lastNames.add('Harsha KG');
        lastNames.add('Sharva Reddy');
        System.debug('lastNames');
        System.debug('lastNames[5]');
}