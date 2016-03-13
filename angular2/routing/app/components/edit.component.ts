import {Component} from 'angular2/core'
import {ChildComponent} from './child.component';



const template = `
<h2>Edit/View</h2>

 <div class="btn_area">
     <div class="open_btn" (click)="openGroup()"> Group表示</div>
 </div>
 <div class="group_area">
         <div class="group" *ngFor="#group of groups">
            <input type="checkbox">{{group}}
         </div>
 </div>


 <div class="child_area">
   <my-child title="{{child}}">Loading...</my-child>
 </div>

`;

@Component({
  template: template,
    styles: [`
    .btn_area {
      margin-top: .8em;
    }
    .child_area {
      left: -1px;
      top: -4px;
      margin-top: .8em;
      margin-left: .8em;
    }

  `],

  directives: [ChildComponent]
})
export class Edit {
  public groups = [];
  groupExpanded = false;

  child ='';
  constructor() {
    this.child='Prod';
  }
  openGroup(){
      if(this.groupExpanded){
         this.groups = [];
         this.groupExpanded = false;
      }else{
         this.groups = ['America', 'Japan', 'Europe', 'China'];
         this.groupExpanded = true;
      }
  }

}