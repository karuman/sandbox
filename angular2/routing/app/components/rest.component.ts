import {bootstrap} from 'angular2/platform/browser';
import {Component, Injectable} from 'angular2/core';
import {Observable} from 'rxjs/Observable';
import {HTTP_PROVIDERS, Http, Request, Response} from 'angular2/http';
import 'rxjs/add/operator/map';

// データの型
interface Sample {
}

// Ajaxを行うサービス
@Injectable()
class SampleService {

  constructor(private http: Http) {
  }

  fetch(): Observable<Sample> {
    return this.http.get("./mock/1_get.json").map(res=>res.json() );
  }
}

// サービスを呼び出すコンポーネント
@Component({
  selector: 'my-rest',
  template: `
    <h3>Http example</h3>
         <div *ngFor="#d of data">
           {{d.name}}
           {{d.id}}
         </div>
    <div *ngIf="condition">
       <pre>{{ data | json }}</pre>
    </div>
  `,
  providers: [SampleService]
})
export class MyRest {
  public data: Sample;

  constructor(private service: SampleService) {
  }

  ngOnInit() {
    this.service.fetch().subscribe(data=>this.data = data);
  }
}
