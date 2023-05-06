public with sharing class RedditDataTest {

    public static List <Reddit_Post__c> generateRedditPostRecords(){

        List <Reddit_Post__c> newListReddit = new List <Reddit_Post__c>();

        for (Integer i = 1; i <= 80; i++) {

            Reddit_Post__c rp = new Reddit_Post__c();
            rp.Name = 'Post Name '+i;
            rp.Author__c = 'Author Name '+i;
            rp.Author_Full_Name__c = 'Author Full Name '+i;
            rp.Thumbnail__c = 'Thumbnail '+i;
            rp.Selftext__c = 'Selftext '+i;
            newListReddit.add(rp);

        }

        if (!newListReddit.isEmpty()) {
            insert newListReddit;
        }
        
        return newListReddit;
    
    }

    public static User generateUser(){

        Profile prof = [SELECT Id FROM Profile WHERE Name = 'Minimum Access - Salesforce'];

        User myUser = new User(FirstName = 'Test',
                                LastName = 'User',
                                Alias = 'tuser',
                                Email = 'jonas.junior.pinto@test.org',
                                Username = 'jonas.junior.pinto@test.org',
                                LanguageLocaleKey = 'en_US',
                                EmailEncodingKey = 'UTF-8',
                                TimeZoneSidKey = 'America/Los_Angeles',
                                LocaleSidKey = 'en_US',
                                ProfileId = prof.Id
        );

        insert myUser;
        return myUser;

    }

}