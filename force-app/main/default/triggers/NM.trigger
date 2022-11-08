trigger NM on Lead (before insert) {
    Set<string>lastNames = new Set<string>();
    for(Lead l: Trigger.new){
        lastNames.add(l.LastName);
    }
    System.debug(lastNames);
}