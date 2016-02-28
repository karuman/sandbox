import {Component} from 'angular2/core'
import {ChildComponent} from './child.component';



const template = `
<h2>Edit/View</h2>

 <my-child title="{{child}}">Loading...</my-child>

`;

@Component({
  template: template,
  directives: [ChildComponent]
})
export class Edit {
  child ='';
  constructor() {
    this.child='Prod';
  }
}