public with sharing class RedditWrapper {

    @AuraEnabled
    public Post data;

    public class Post {
        @AuraEnabled
        public List<Children> children;
    }

    public class Children {
        @AuraEnabled
        public Data data;
    }

    public class Data {
        @AuraEnabled
        public String title;
        @AuraEnabled
        public String author;
        @AuraEnabled
        public String author_fullname;
        @AuraEnabled
        public String thumbnail;
        @AuraEnabled
        public String selftext;
    }

    @TestVisible
    public static RedditWrapper parse(String json) {
        return (RedditWrapper) System.JSON.deserialize(json, RedditWrapper.class);
    }
}