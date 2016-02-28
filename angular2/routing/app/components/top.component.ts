import {Component} from 'angular2/core'
import {Router} from 'angular2/router'

const template = `
<h2>Top</h2>
<div class="top_btn" (click)="goEdit()">go to Edit</div>
<div class="top_btn" (click)="goSearch()">go to Search</div>
`;

@Component({
  template: template,
  styles: [`
    .top_btn {
      background-color: #FFFFFF;
      border: 1px solid #000000;
      left: -1px;
      top: -4px;
      width : 10em;
      margin-right: .8em;
      margin-top: .8em;
      border-radius: 4px 4px 4px 4px ;
    }

  `]

})
export class Top  {
  constructor(public router: Router) {
  }

  goEdit() {
    console.log('go to Edit');
    this.router.navigate(['Edit']);
  }
  goSearch() {
    console.log('go to search');
    this.router.navigate(['Search']);
  }
}