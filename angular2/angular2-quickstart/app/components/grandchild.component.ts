import {Component,Input} from 'angular2/core';

@Component({
    selector: 'my-grandchild',
    template: `
<div class="grandchild " (click)="getDetail()">{{title}}
   <div>{{description}} </div>
</div>
`,
    styles: [`
    .grandchild {
      background-color: #FFFFFF;
      border: 1px solid #000000;
      width : 30em;
      left: -1px;
      top: -4px;
      margin-right: .8em;
      border-radius: 4px 4px 4px 4px;
    }
  `],

})
export class GrandchildComponent {
  @Input() title: string;
  // public title = "grandchild";
  description="";
  expanded = false;
  constructor() {
    this.description="";
  }
  getDetail(){
      if(this.expanded){
         this.description="";
         this.expanded = false;
      }else{
         this.description="Detail Description: ABCD";
         this.expanded = true;
      }
  }
}
