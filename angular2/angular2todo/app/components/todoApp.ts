import {Component} from 'angular2/core';
import {TodoStore, Todo} from './store';
       
@Component({
	selector: 'todo-app',
        providers: [TodoStore],
	templateUrl: './app/components/todoApp.html',
        styleUrls:['./app/components/todoApp.css']
})
export class TodoApp {
	todoStore: TodoStore;
	newTodoText = '';
        prev_code ='';

	constructor(private todoStore1: TodoStore) {
		this.todoStore = todoStore1;
	}

	stopEditing(todo: Todo, editedTitle: string) {
		todo.title = editedTitle;
		todo.editing = false;
	}

	cancelEditingTodo(todo: Todo) {
		todo.editing = false;
	}

	updateEditingTodo(todo: Todo, editedTitle: string) {
		editedTitle = editedTitle.trim();
		todo.editing = false;

		if (editedTitle.length === 0) {
			return this.todoStore.remove(todo);
		}

		todo.title = editedTitle;
	}

	editTodo(todo: Todo) {
		todo.editing = true;
	}

	removeCompleted() {
		this.todoStore.removeCompleted();
	}

	toggleCompletion(todo: Todo) {
		this.todoStore.toggleCompletion(todo);
	}

	remove(todo: Todo){
		this.todoStore.remove(todo);
	}

	addTodo() {
		if (this.newTodoText.trim().length) {
			this.todoStore.add(this.newTodoText);
			this.newTodoText = '';
		}
                console.log("prev_code:",this.prev_code);
	}
	eventHandler(event) {
  	  console.log(event, event.keyCode, event.keyIdentifier);
          this.prev_code=event.keyCode;
       } 
}