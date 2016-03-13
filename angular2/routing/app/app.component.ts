import {Component} from 'angular2/core'
import {RouteConfig, ROUTER_DIRECTIVES} from 'angular2/router'
import {Top} from './components/top.component'
import {Edit} from './components/edit.component'
import {Search} from './components/search.component'


const template = `
<a [routerLink]="['Top']">topページに戻る</a>
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
    path: '/top',
    component: Top,
    name: 'Top'
  },
  {
    path: '/edit/:id',
    component: Edit,
    name: 'Edit'
  },
  {
    path: '/search',
    component: Search,
    name: 'Search'
  }
])
export class AppComponent {
}
