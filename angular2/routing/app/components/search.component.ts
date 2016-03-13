import {Component} from 'angular2/core'
import {Router} from 'angular2/router'
import {Observable} from 'rxjs/Observable';
import RestService from "./restService";
import {MyRest} from './rest.component';

const template = `
<h2>Search</h2>
  <div class="container">
       <div class="form-group">
         <label for="name">条件１</label>
         <input type="text" class="form-control" required>
       </div>
       <div class="form-group">
         <label for="alterEgo">条件２</label>
         <input type="text" class="form-control">
       </div>
       <div class="btn_group">
         <div class="search_btn" (click)="doSearch()"> 検索</div>
         <div class="search_btn" (click)="doReset()"> クリア</div>
       </div>
       <div class="results">
         <div  *ngFor="#result of results">
            <div class="result" (click)="goEdit()">  {{result.name}} </div>
         </div>
       </div>
  </div>
<my-rest>Loading...</my-rest>
`;

@Component({
  template: template,
    styles: [`
    .btn_group {
	overflow: hidden;
    }
    .search_btn {
      float: left;
      background-color: #FFFFFF;
      border: 1px solid #000000;
      left: -1px;
      top: -4px;
      width : 3em;
      margin-right: .8em;
      border-radius: 4px 4px 4px 4px ;
    }
    .results {
      left: -30px;
      top: 100px;
      background-color: #FAFAFA;
      width : 20em;
      margin-right: .10em;
      margin-top: .50em;
      margin-left: .50em;

    }
    .result {
      background-color: #FFFFFF;
      border: 1px solid #000000;
      left: -1px;
      top: -4px;
      width : 3em;
      margin-right: .8em;
      margin-top: .50em;
      margin-left: .50em;
      border-radius: 4px 4px 4px 4px ;
    }

  `],
    providers: [RestService],
    directives: [MyRest]

})
export class Search {

  public results:string[] ;
  items: Observable<string>;

  constructor(public router: Router,private restService:RestService) {
  }

  goEdit() {
    console.log('go to Edit');
    this.router.navigate(['Edit']);
  }
  doSearch() {
    console.log('do search');
//    this.results = ['prod1', 'prod2', 'prod3', 'prod4'];
     this.results=this.restService.get();
//       this.items = this.restService.get();
       console.log('get results');
       console.log(this.items);

  }
  doReset() {
    this.results = [];
//    this.items = [];
  }

}