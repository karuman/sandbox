import {Component} from 'angular2/core';
import {ChildComponent} from './components/child.component';
import {InjChildComponent} from './components/injchild.component';

@Component({
    selector: 'my-app',
    template: `
<h1>My First Angular 2 App</h1>
<my-child>Loading...</my-child>
<my-injchild>Loading...</my-injchild>
`,
directives: [ChildComponent,InjChildComponent]
})
export class AppComponent {
}
