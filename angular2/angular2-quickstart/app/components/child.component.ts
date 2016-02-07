import {Component,Input} from 'angular2/core';
import {GrandchildComponent} from './grandchild.component';

@Component({
    selector: 'my-child',

    template: `
       <div class="child" (click)="getList()">
         {{title}} {{flag}}
       </div>
        <span>
         <div class="grandchild" *ngFor="#grandchild of grandchildren">
               <my-grandchild title="{{ grandchild}}">Loading...</my-grandchild>
         </div>
        </span>
`,

    styles: [`
    .child {
      background-color: #FFFFFF;
      border: 1px solid #000000;
      left: -1px;
      top: -4px;
      width : 30em;
      margin-right: .8em;
      border-radius: 4px 4px 4px 4px ;
    }

    .grandchild {
      position: relative;
      left: 100px;
    }
  `],
    directives: [GrandchildComponent]
})


export class ChildComponent {
  @Input() title: string;
  public grandchildren ;
  expanded = false;
  flag = '+';
  getList(){
      if(this.expanded){
         this.grandchildren =[];
         this.expanded = false;
         this.flag = '+';
      }else{
         this.grandchildren = ['Windstorm', 'Bombasto', 'Magneta', 'Tornado'];
         this.expanded = true;
         this.flag = '-';
      }
  }
}
