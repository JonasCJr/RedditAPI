public with sharing class RedditWebService {

    private static final String REDDIT_URL = 'https://www.reddit.com/r/ContagiousLaughter/new.json?limit=40';
    private static final String GET = 'GET';

    public static List<RedditWrapper.Data> getRedditData(){

        List <RedditWrapper.Data> redditData = new List <RedditWrapper.Data>();

        Http httpCallout = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(REDDIT_URL);
        req.setMethod(GET);

        HttpResponse redditCallOut = httpCallout.send(req);
        RedditWrapper redditResponse = RedditWrapper.parse(redditCallOut.getBody());

        List <RedditWrapper.Children> redditPosts = redditResponse.data.children;

        for (RedditWrapper.Children child : redditPosts) {
            redditData.add(child.data);
        }

        return redditData;

    }

}