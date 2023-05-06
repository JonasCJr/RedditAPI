global class RedditInsertRecordJob implements Schedulable, Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {

    global void execute (SchedulableContext sc) {
        RedditInsertRecordJob rirj = new RedditInsertRecordJob();
        database.executebatch(rirj);
    }

    global Database.QueryLocator start (Database.BatchableContext context){
        return Database.getQueryLocator('SELECT Id FROM Reddit_Post__c ORDER BY CreatedDate');
    }

    global void execute (Database.BatchableContext context, List <Reddit_Post__c> scope){
        RedditUtility.insertRedditPosts();
    }

    global void finish (Database.BatchableContext context){
        RedditUtility.deleteAndKeepLast40();
    }

}