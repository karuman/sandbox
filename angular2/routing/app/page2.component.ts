import {Component} from 'angular2/core'
import {Router} from 'angular2/router'

const template = `
<h2>page 2</h2>
<button (click)="goPage1()">go to page1</button>
`;

@Component({
  template: template
})
export class Page2 {
  constructor(public router: Router) {
  }

  goPage1() {
    console.log('go to page1');
    this.router.navigate(['Spam']);
  }
}