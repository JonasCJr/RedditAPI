@isTest
global class RedditMockHttp implements httpCalloutMock {

    private String setBody{get; set;}
    private Integer setStatusCode{get; set;}

    public String getBody() { return setBody; }
    public Integer getStatusCode() { return setStatusCode; }

    public RedditMockHttp(String body, Integer statusCode){
        setBody = body;
        setStatusCode = statusCode;
    }

    global HttpResponse respond(HttpRequest request) {

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type','application/json');
        response.setBody(setBody);
        response.setStatusCode(setStatusCode);
        return response;

    }

}