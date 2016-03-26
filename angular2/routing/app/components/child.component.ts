import {Component,Input} from 'angular2/core';
import {Product} from './prod';

@Component({
    selector: 'my-child',

    template: `
       <div class="child_top">
         <span class="child" >{{product.name}} </span>
         <span class="btn" (click)="getList()">{{flag}}</span>
         <span class="btn" (click)="addList()">ADD</span>
       </div>

        <span>
         <div class="grandchild" *ngFor="#grandchild of grandchildren">
               <my-child [product]="grandchild">Loading...</my-child>
         </div>
        </span>
`,

    styles: [`
    .child_top {
      background-color: #FFFFFF;
      border: 1px solid #000000;
      width : 11em;
      left: -1px;
      top: -4px;
      margin-right: .8em;
      border-radius: 4px 4px 4px 4px ;
    }
    .child {
      left: -1px;
      top: -4px;
      width : 10em;
      margin-right: .8em;
    }
    .btn {
      width : 1em;

    }



    .grandchild {
      position: relative;
      left: 100px;
    }
  `],
  directives: [ChildComponent]
})


export class ChildComponent {
  @Input() product: Product;
  public grandchildren : Product[];
  expanded = false;
  flag = '+';
  getList(){
      if(this.expanded){
         this.grandchildren =[];
         this.expanded = false;
         this.flag = '+';
      }else{
//         this.grandchildren = ['Windstorm', 'Bombasto', 'Magneta', 'Tornado'];
         this.grandchildren = this.product.children;
         this.expanded = true;
         this.flag = '-';
      }
  }
  addList(){
     let result=new Product(123,"TEST","TET PROD",[]);
     this.product.children.push(result);
  }
}
