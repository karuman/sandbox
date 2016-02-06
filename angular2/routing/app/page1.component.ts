import {Component} from 'angular2/core'

const template = `
<h2>page 1</h2>
`;

@Component({
  template: template
})
export class Page1 implements OnActivate, OnReuse, OnDeactivate, CanReuse, CanDeactivate {
  routerOnActivate() {
    console.log('onActivate');
  }

  routerOnReuse() {
    console.log('onReuse');
  }

  routerOnDeactivate() {
    console.log('onDeactivate');
  }

  routerCanReuse() {
    return confirm('can reuse?');
  }

  routerCanDeactivate() {
    return confirm('can deactivate?');
  }
}