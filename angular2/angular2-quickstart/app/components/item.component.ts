import {Component,Input} from 'angular2/core';
import {Item} from './item';

@Component({
    selector: 'my-item',
    template: `
       <div class="my-item">
         <h2>My Item Component:{{item2.name}}</h2>
         <button (click)="getList()">Get List</button>
         <button (click)="reset()">Reset</button>
       </div>
`,
    styles: [`
    .my-item {
      background-color : #00EEDD;
    }
  `]
 
})
export class ItemComponent {
  @Input() item: Item;
  item2 = new Item(1,'aaa','bbb','describe');
  constructor( ) { }

}
