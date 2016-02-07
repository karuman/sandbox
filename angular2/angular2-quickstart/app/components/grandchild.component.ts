import {Component,Input} from 'angular2/core';

@Component({
    selector: 'my-grandchild',
    template: `
<div class="title">My 1st {{title}} Component</div>
`
})
export class GrandchildComponent {
  @Input() title: string;
  // public title = "grandchild";
  constructor() {
  }
}
