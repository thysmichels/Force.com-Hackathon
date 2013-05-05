global class HealthLeadReassign implements Database.Batchable<sObject> {
	
	String query;
		
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<User> scope) 
   	{
		List<User> usersToUpdate = new List<User>();
		for (User user : scope)
		{
			user.IsActive = false;
			usersToUpdate.add(user);
		}

		update usersToUpdate;
	}
	
	global void finish(Database.BatchableContext BC) 
	{
		//send email confirmation to users that they have been disabled.


	}
	
}