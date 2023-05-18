import { api, LightningElement, wire, track } from 'lwc';
import getRedditPosts from '@salesforce/apex/RedditPostControler.getRedditPosts';

export default class RedditPostView extends LightningElement {

    //Estou vendo esse exemplo:
    //https://techdicer.com/accordion-in-lightning-web-componentslwc/
    //https://www.sfdckid.com/2021/07/how-to-fetch-data-in-lwc-salesforce.html

    @api redditPosts;
    @api errors;

    @wire (getRedditPosts) wiredRedditPosts({data, error}){
        if (data) {
            console.log('DATA JUNIOR >> '+data);
            this.redditPosts = data;
            this.errors = undefined;
        } else if (error) {
            console.log('ERROR JUNIOR >> '+error);
            this.redditPosts = undefined;
            this.errors = error;
        }
    }

    /*@track data = [
        { id: 1, name: 'Ankit', type: 'CS', buttonname: 'CS1', imageUrl:'https://source.unsplash.com/user/c_v_r/100x100'},
        { id: 2, name: 'Rijwan', type: 'EC', buttonname: 'EC2', imageUrl:'https://i.picsum.photos/id/887/200/200.jpg?hmac=yOynpt597y5pLfJ5SsRVVKZiT5MXElbhtgUYeRzu3S4'},
        { id: 3, name: 'Himanshu', type: 'MEC', buttonname: 'MEC3', imageUrl:'https://source.unsplash.com/user/c_v_r/100x100'},
        { id: 4, name: 'Anil', type: 'CS', buttonname: 'CS4', imageUrl:'https://source.unsplash.com/user/c_v_r/100x100'},
        { id: 5, name: 'Sachin', type: 'MSC', buttonname: 'CS5', imageUrl:'https://source.unsplash.com/user/c_v_r/100x100'},
    ];*/
     
    handleSectionToggle(event){
        console.log(event.detail.openSections);
    }
        
    /********************************* PART 1 *********************************/
    
    /*
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
    }*/

}