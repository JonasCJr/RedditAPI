@isTest
private class RedditPostControlerTest {

    private static testMethod void successfulTest() {
        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
        System.assertNotEquals(null, newListReddit);
        RedditPostControler.getRedditPosts();
    }

}