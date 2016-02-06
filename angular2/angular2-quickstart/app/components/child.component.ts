import {Component} from 'angular2/core';
import {GrandchildComponent} from './grandchild.component';

@Component({
    selector: 'my-child',
    template: `
<h2>My 1st Child Component</h2>
<my-grandchild>Loading...</my-grandchild>
`,
directives: [GrandchildComponent]
})
export class ChildComponent { }
