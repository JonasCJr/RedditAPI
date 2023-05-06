@isTest
private class RedditUtilityTest {

    public static String responseSuccess = '{"data": {"children": [{"data":{ "selftext":"","author_fullname":"t2_e09rx", "author": "Brassattack84","title": "Homeboy absolutely","thumbnail": "https://b.thumbs.redditmedia.com/h_kj4j5bDWji3t1QzedTyj_s-PzmJtO9dDdV6CcQiOc.jpg"}}]}}';
    public static String responseError = '{"data": {"children": [{"data":{ "selftext":"","author_fullname":"oioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioioi", "author": "Brassattack84","title": "Homeboy absolutely","thumbnail": "https://b.thumbs.redditmedia.com/h_kj4j5bDWji3t1QzedTyj_s-PzmJtO9dDdV6CcQiOc.jpg"}}]}}';

    private static testMethod void successfulCallOutTest(){

        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
        System.assertNotEquals(null, newListReddit);

        RedditMockHttp myMock = new RedditMockHttp(responseSuccess, 200);
        Test.setMock(httpCalloutMock.class, myMock);
        System.assertNotEquals(null, myMock);
        HttpResponse resp = myMock.respond(new HttpRequest());

        Test.StartTest();
            RedditUtility.insertRedditPosts();
        Test.StopTest();

    }

    private static testMethod void errorCallOutTest(){

        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
        System.assertNotEquals(null, newListReddit);

        RedditMockHttp myMock = new RedditMockHttp(responseError, 200);
        Test.setMock(httpCalloutMock.class, myMock);
        System.assertNotEquals(null, myMock);
        HttpResponse resp = myMock.respond(new HttpRequest());

        Test.StartTest();
            RedditUtility.insertRedditPosts();
        Test.StopTest();

    }

    private static testMethod void successfulDeleteTest(){

        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
        System.assertNotEquals(null, newListReddit);
        RedditUtility.deleteAndKeepLast40();

    }

    private static testMethod void errorDeleteTest(){

        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
        System.assertNotEquals(null, newListReddit);
        User us = RedditDataTest.generateUser();
        System.runAs(us){
            RedditUtility.deleteAndKeepLast40();
        }

    }

}