import {bootstrap} from 'angular2/platform/browser';
import {Component, Injectable} from 'angular2/core';
import {HTTP_PROVIDERS, Http, Request, Response} from 'angular2/http';
import {Observable} from 'rxjs/Observable';

import 'rxjs/add/operator/map';


// データの型
interface Sample {
}

@Injectable()
export default class RestService {

  constructor(private http: Http) {
  }
  ot: Observable<string>;
  status:number;
  body : string;


  get()  {

////     return this.http.get("/1_get.json")
////      .map(res => res.json() as Sample)
////      .finally(()=>{
////        console.log("end")
////      });

    this.http.request(new Request({
     method: "Get",
     url: "./mock/search/2_get.json"
      })).subscribe((res: Response) => {
        this.status = res.status;
        this.body = res.json();
        console.log('response:' + this.status);
        console.log('body:' + this.body);
        console.log("sub end")
        this.ot=res.json();
    });
    console.log("main end")
//    return ['rprod1', 'rprod2', 'rprod3', 'rprod4'];
      return this.ot;
  }
}
