import {Component} from 'angular2/core';
import {GrandchildComponent} from './grandchild.component';

@Component({
    selector: 'my-child',
    template: `
       <div class="child">
         <h2>My 1st {{title}} Component</h2>
         <button (click)="getList()">Get List</button>
         <button (click)="reset()">Reset</button>
         <div class="grandchild" *ngFor="#grandchild of grandchildren">
               <my-grandchild title="{{ grandchild}}">Loading...</my-grandchild>
         </div>
       </div>
`,
    styles: [`
    .child {
      background-color : #00EEDD;
    }
    .grandchild {
      position: relative;
      left: 200px;
    }
  `],
    directives: [GrandchildComponent]
})
export class ChildComponent {
  public grandchildren ;
  public title = "child";
  getList(){
      this.grandchildren = ['Windstorm', 'Bombasto', 'Magneta', 'Tornado'];
  }
  reset(){
      this.grandchildren =[];
  }
}
