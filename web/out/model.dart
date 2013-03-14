// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library model;

import 'package:web_ui/observe.dart';
import 'package:web_ui/observe/html.dart';
import 'package:web_ui/observe/observable.dart' as __observe;


@observable
class ViewModel {
  bool isVisible(Todo todo) => todo != null &&
      ((showIncomplete && !todo.done) || (showDone && todo.done));

  bool get showIncomplete => locationHash != '#/completed';

  bool get showDone => locationHash != '#/active';
}

final ViewModel viewModel = new ViewModel();

// The real model:

@observable
class AppModel  implements Observable{
  ObservableList<Todo> __$todos = new ObservableList<Todo>();
  ObservableList<Todo> get todos {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'todos');
    }
    return __$todos;
  }
  set todos(ObservableList<Todo> value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'todos',
          __$todos, value);
    }
    __$todos = value;
  }

  // TODO(jmesserly): remove this once List has a remove method.
  void removeTodo(Todo todo) {
    var index = todos.indexOf(todo);
    if (index != -1) {
      todos.removeRange(index, 1);
    }
  }

  bool get allChecked => todos.length > 0 && todos.every((t) => t.done);

  set allChecked(bool value) => todos.forEach((t) { t.done = value; });

  int get doneCount {
    int res = 0;
    todos.forEach((t) { if (t.done) res++; });
    return res;
  }

  int get remaining => todos.length - doneCount;

  void clearDone() {
    // TODO(jmesserly): should methods on ObservableList return Observables?
    todos = toObservable(todos.where((t) => !t.done));
  }
final int hashCode = ++__observe.Observable.$_nextHashCode;
  var $_observers;
  List $_changes;
  }

final AppModel app = new AppModel();

@observable
class Todo  implements Observable{
  String __$task;
  String get task {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'task');
    }
    return __$task;
  }
  set task(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'task',
          __$task, value);
    }
    __$task = value;
  }
  bool __$done = false;
  bool get done {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'done');
    }
    return __$done;
  }
  set done(bool value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'done',
          __$done, value);
    }
    __$done = value;
  }

  Todo(task) : __$task = task;

  String toString() => "$task ${done ? '(done)' : '(not done)'}";
final int hashCode = ++__observe.Observable.$_nextHashCode;
  var $_observers;
  List $_changes;
  }

//@ sourceMappingURL=model.dart.map