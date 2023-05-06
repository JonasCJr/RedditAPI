public with sharing class RedditPostControler {

    @AuraEnabled(cacheable=true)
    public static List<Reddit_Post__c> getRedditPosts(){

        return [SELECT Id, Name, Author_Full_Name__c, Author__c, Thumbnail__c, Photo__c, Selftext__c, CreatedDate
            FROM Reddit_Post__c
            ORDER BY CreatedDate DESC LIMIT 40];

    }
    
}