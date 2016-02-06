import {Component} from 'angular2/core';
import FooService from "./fooService";

@Component({
    selector: 'my-injchild',
    providers: [FooService],
    template: `
<h2>My 1st {{title}} Component</h2>
`,
})
export class InjChildComponent {
  public title;
  constructor(private fooService: FooService){
      this.title = fooService.say();
  }
}
