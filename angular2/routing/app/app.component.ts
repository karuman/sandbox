import {Component} from 'angular2/core'
import {RouteConfig, ROUTER_DIRECTIVES} from 'angular2/router'
import {Page1} from './page1.component'
import {Page2} from './page2.component'

const template = `
<a [routerLink]="['Spam']">page1</a>
<a [routerLink]="['Ham']">page2</a>
<router-outlet></router-outlet>
`;

@Component({
  selector: 'my-app',
  template: template,
  directives: [ROUTER_DIRECTIVES]
})
@RouteConfig([
  {
    useAsDefault: true,
    path: '/page1',
    component: Page1,
    name: 'Spam'
  },
  {
    path: '/page2',
    component: Page2,
    name: 'Ham'
  }
])
export class AppComponent {
}
