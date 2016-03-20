import {bootstrap} from 'angular2/platform/browser';
import {Component, Injectable} from 'angular2/core';
import {HTTP_PROVIDERS, Http, Request, Response} from 'angular2/http';
import {Observable} from 'rxjs/Observable';
import {Product} from './prod';

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

  //------------------------------------------------------------------------
  //
  //
  //------------------------------------------------------------------------
  getProduct(id:string) {
    // return an observable
   
    let url='./mock/prod/'+id+'_get.json';
    return this.http.get(url)
    .map( (responseData) => {
      return responseData.json();
    })
    .map((product: any) => {
      let result:Product ;
      if (product) {
         result=new Product(product.id, product.name,product.description);
      }
      return result;
    });
  }

  //------------------------------------------------------------------------
  //
  //
  //------------------------------------------------------------------------
  getSearch() {
    // return an observable
    return this.http.get('./mock/search/2_get.json')
    .map( (responseData) => {
      return responseData.json();
    })
    .map((products: Array<any>) => {
      let result:Array<Product> = [];
      if (products) {
        products.forEach((product) => {
          result.push(new Product(product.id, product.name,product.description));
        });
      }
      return result;
    });
  }
}
