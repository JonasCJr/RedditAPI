import { api, LightningElement, wire } from 'lwc';
import getRedditPosts from '@salesforce/apex/RedditPostControler.getRedditPosts';

export default class RedditPostView extends LightningElement {

    @api redditPosts;
    @api errors;

    @wire(getRedditPosts,{})

    wiredRedditPosts({data, error}){
        if (data) {
            this.redditPosts = data;
            this.errors = undefined;
        } else if (error) {
            this.redditPosts = undefined;
            this.errors = error;
        }
    }

}