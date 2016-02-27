import {Component} from 'angular2/core';
import {TodoApp} from './components/todoApp';

@Component({
    selector: 'my-app',
    template: `
<todo-app>Loading ...</todo-app>
`,
directives: [TodoApp]
})
export class AppComponent {
  constructor() {
  }
}
