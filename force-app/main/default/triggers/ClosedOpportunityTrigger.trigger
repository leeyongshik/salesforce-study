trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    // Create a list to hold the tasks to be inserted
    List<Task> newTasks = new List<Task>();
    
    // Iterate through each Opportunity record in the Trigger context
    for(Opportunity opp : Trigger.new) {
        
        // Check if the Opportunity's Stage is Closed Won
        if(opp.StageName == 'Closed Won') {
            
            // Create a new Task for the Opportunity
            Task newTask = new Task();
            newTask.Subject = 'Follow Up Test Task';
            newTask.WhatId = opp.Id;
            
            // Add the new Task to the list of tasks to be inserted
            newTasks.add(newTask);
        }
    }
    
    // Insert the list of tasks
    if(newTasks.size() > 0) {
        insert newTasks;
    }
}