import {Component} from 'angular2/core'
import {Router} from 'angular2/router'


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
       <div class="search_btn" (click)="doSearch()"> 検索</div>
       <div class="search_btn" (click)="doReset()"> クリア</div>
       <div class="results">
         <div  *ngFor="#result of results">
            <div class="result" (click)="goEdit()">  {{result}} </div>
         </div>
       </div>
  </div>
`;

@Component({
  template: template,
    styles: [`
    .search_btn {
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
      width : 5em;
      margin-right: .10em;
    }
    .result {
      background-color: #FFFFFF;
      border: 1px solid #000000;
      left: -1px;
      top: -4px;
      width : 3em;
      margin-right: .8em;
      border-radius: 4px 4px 4px 4px ;
    }

  `]

})
export class Search {

  public results ;

  constructor(public router: Router) {
  }

  goEdit() {
    console.log('go to Edit');
    this.router.navigate(['Edit']);
  }
  doSearch() {
    console.log('do search');
    this.results = ['prod1', 'prod2', 'prod3', 'prod4'];
  }
  doReset() {
    this.results = [];
  }
}