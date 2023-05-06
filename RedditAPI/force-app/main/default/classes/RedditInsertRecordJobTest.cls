@isTest
global class RedditInsertRecordJobTest {

    public static String responseSuccess = '{"data": {"children": [{"data":{ "selftext":"","author_fullname":"t2_e09rx", "author": "Brassattack84","title": "Homeboy absolutely","thumbnail": "https://b.thumbs.redditmedia.com/h_kj4j5bDWji3t1QzedTyj_s-PzmJtO9dDdV6CcQiOc.jpg"}}]}}';

    @TestSetup
    static void CreatedDate(){
        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
    }

    @isTest
    public static void scheduleMethodTest(){

        Integer incMinutes = 1;
        String day = String.valueOf(System.now().addMinutes(incMinutes).day());
        String month = String.valueOf(System.now().addMinutes(incMinutes).month());
        String hour = String.valueOf(System.now().addMinutes(incMinutes).hour());
        String minute = String.valueOf(System.now().addMinutes(incMinutes).minute());
        String second = String.valueOf(System.now().addMinutes(incMinutes).second());
        String year = String.valueOf(System.now().addMinutes(incMinutes).year());
        String sche = '0 ' + minute + ' '+ hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        System.assertNotEquals(null, sche);

        Test.StartTest();
            RedditInsertRecordJob rirj = new RedditInsertRecordJob();
            String cronId = System.schedule('RedditInsertRecordJobTest', sche, rirj);
        Test.StopTest();

    }

    @isTest
    static void testCallout(){
        List <Reddit_Post__c> newListReddit = RedditDataTest.generateRedditPostRecords();
        System.assertNotEquals(null, newListReddit);

        RedditMockHttp myMock = new RedditMockHttp(responseSuccess, 200);
        Test.setMock(httpCalloutMock.class, myMock);
        System.assertNotEquals(null, myMock);
        HttpResponse resp = myMock.respond(new HttpRequest());
    }

}