public with sharing class RedditUtility {

    public static void insertRedditPosts(){

        try {

            List <RedditWrapper.Data> redditDataList = RedditWebService.getRedditData();
            List <Reddit_Post__c> newListReddit = new List <Reddit_Post__c>();

            for (RedditWrapper.Data data : redditDataList) {

                Reddit_Post__c rp = new Reddit_Post__c();
                rp.Name = (data.title.length() > 80) ? data.title.substring(0,80) : data.title;
                rp.Author__c = data.author;
                rp.Author_Full_Name__c = data.author_fullname;
                rp.Thumbnail__c = data.thumbnail;
                rp.Selftext__c = (String.isBlank(data.selftext)) ? 'Nothing to show' : data.selftext;

                newListReddit.add(rp);
            }

            if (!newListReddit.isEmpty()) {
                insert newListReddit;
            }

        } catch (Exception ex){
            System.debug('get message >> '+ex.getMessage());
        }

    }

    public static void deleteAndKeepLast40(){
        try {

            List <Reddit_Post__c> redditPostListToDelete = new List <Reddit_Post__c>();

            Set <Id> redditPostSetId = new Set <Id>();

            for (Reddit_Post__c redditId : [SELECT Id FROM Reddit_Post__c ORDER BY CreatedDate DESC LIMIT 40]) {
                redditPostSetId.add(redditId.Id);
            }

            for (Reddit_Post__c redditPost : [SELECT Id FROM Reddit_Post__c]) {
                if (!redditPostSetId.contains(redditPost.Id)) {
                    redditPostListToDelete.add(redditPost);
                }
            }

            if (!redditPostListToDelete.isEmpty()) {
                delete redditPostListToDelete;
            }

        } catch (Exception ex){
            System.debug('get message >> '+ex.getMessage());
        }
    }


}