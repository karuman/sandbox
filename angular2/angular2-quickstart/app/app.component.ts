import {Component} from 'angular2/core';
import {ChildComponent} from './components/child.component';

@Component({
    selector: 'my-app',
    template: `
<h1>My First Angular 2 App</h1>
<my-child>Loading...</my-child>
`,
directives: [ChildComponent]
})
export class AppComponent {

}
