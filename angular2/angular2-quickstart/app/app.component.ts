import {Component} from 'angular2/core';
import {ChildComponent} from './components/child.component';
import {InjChildComponent} from './components/injchild.component';
import {Item} from './components/item';
import {ItemComponent} from './components/item.component';


@Component({
    selector: 'my-app',
    template: `
<h1>My First Angular 2 App</h1>

 <div class="child" *ngFor="#child of children">
   <my-child title="{{child}}">Loading...</my-child>
 </div>

<my-injchild>Loading...</my-injchild>
<my-item item="{{item}}">Loading...</my-item>
<button (click)="reset()">Reset</button>


`,
directives: [ChildComponent,InjChildComponent,ItemComponent]
})
export class AppComponent {
  public item:Item =  new Item(1,'aaa','bbb','describe');
  public children =  ['child1', 'child2', 'child3', 'child4'];
  constructor() {
    // item_title="Item0 try";  // this is too late to initialize.
  }
  reset(){
      this.item=   new Item(1,'aaa','bbb','describe');
  }

}
