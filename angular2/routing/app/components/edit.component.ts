import {Component} from 'angular2/core'
import {RouteParams, Router} from 'angular2/router';
import {ChildComponent} from './child.component';
import RestService from "./restService";
import {Product} from './prod';



const template = `
<h2>Edit/View  {{title}}</h2>

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

    <H1>
           {{ product.name }}
    </H1>

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
  providers: [RestService],
  directives: [ChildComponent]
})
export class Edit {
  product: Product;
  public groups = [];
  groupExpanded = false;
  public title:string;

  child ='';
  constructor(
              private restService:RestService,
              public router: Router,
              private _routeParams:RouteParams) {
    this.child='Prod';
    this.product=new Product(0,'','');
  }

  ngOnInit() {
    let id = this._routeParams.get('id');
    this.title=id;
    if(+id>0){ // stringからnumberへのcast
      this.refreshProduct();
    }

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

  refreshProduct() {
    this.restService.getProduct()
      .subscribe(res => this.product = res);
  }


}