trigger salesrole on Opportunity (after insert) {
    List<OpportunityTeamMember> listOpptyTeamMem = new List<OpportunityTeamMember>();
    for(Opportunity oppty : trigger.New){
        OpportunityTeamMember OTM = new OpportunityTeamMember();
        OTM.OpportunityId = oppty.Id;
        OTM.TeamMemberRole = 'Sales Manger';
        OTM.UserId = oppty.OwnerId;
        listOpptyTeamMem.add(OTM);
    }
    if(listOpptyTeamMem.size() > 0){
        insert listOpptyTeamMem;
    }
}