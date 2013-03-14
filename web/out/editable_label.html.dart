// Auto-generated from editable_label.html.
// DO NOT EDIT.

library editable_label;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:html';
import 'package:web_ui/web_ui.dart';



  /**
   * Label whose [value] can be edited by double clicking. When editing, it
   * displays a form and input element, otherwise it displays the label. You
   * can enable two-way binding like this:
   *
   *     <editable-label bind-value="dartAsignableValue">
   *     </editable-label>
   */
  @observable
  class EditableLabel extends WebComponent  implements Observable{
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /**
   * Shadow root for this component. We use 'var' to allow simulating shadow DOM
   * on browsers that don't support this feature.
   */
  var _root;
  static final __html1 = new autogenerated.Element.html('<label class="edit-label"></label>'), __html2 = new autogenerated.Element.html('<form>\n        <input id="edit" class="edit ">\n      </form>'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
    <template id="__e-15"></template>
    <template id="__e-17"></template>
  ''');
  autogenerated.Element __e15, __e17;
  autogenerated.Template __t;

  EditableLabel.forElement(e) : super.forElement(e);

  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    if (_root is autogenerated.ShadowRoot) _root.applyAuthorStyles = true;
    _root.nodes.add(__shadowTemplate.clone(true));
    __e15 = _root.query('#__e-15');
    __t.conditional(__e15, () => !editing, (__t) {
      var __e14;
      __e14 = __html1.clone(true);
      var __binding13 = __t.contentBind(() => value, false);
      __e14.nodes.add(__binding13);
      __t.listen(__e14.onDoubleClick, ($event) { edit(); });
    __t.addAll([new autogenerated.Text('\n      '),
        __e14,
        new autogenerated.Text('\n    ')]);
    });

    __e17 = _root.query('#__e-17');
    __t.conditional(__e17, () => editing, (__t) {
      var __e16, __edit;
      __e16 = __html2.clone(true);
      __edit = __e16.query('#edit');
      __t.listen(__edit.onBlur, ($event) { update($event); });
      __t.listen(__edit.onKeyUp, ($event) { maybeCancel($event); });
      __t.bindClass(__edit, () => editing ? 'editing' : '', false);
      __t.listen(__e16.onSubmit, ($event) { update($event); });
    __t.addAll([new autogenerated.Text('\n      '),
        __e16,
        new autogenerated.Text('\n    ')]);
    });

    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e15 = __e17 = null;
  }

  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }

  /** Original code from the component. */

    bool __$editing;
    bool get editing {
      if (__observe.observeReads) {
        __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'editing');
      }
      return __$editing;
    }
    set editing(bool value) {
      if (__observe.hasObservers(this)) {
        __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'editing',
            __$editing, value);
      }
      __$editing = value;
    }
    String __$value;
    String get value {
      if (__observe.observeReads) {
        __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'value');
      }
      return __$value;
    }
    set value(String value) {
      if (__observe.hasObservers(this)) {
        __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'value',
            __$value, value);
      }
      __$value = value;
    }

    InputElement get _editBox => _root.query('#edit');

    void created() {
      super.created();
      editing = false;
      value = '';
    }

    void edit() {
      editing = true;

      // This causes _editBox to be inserted.
      deliverChangesSync();

      // For IE and Firefox: use .focus(), then reset the value to move the
      // cursor to the end.
      _editBox.focus();
      _editBox.value = '';
      _editBox.value = value;
    }

    void update(Event e) {
      e.preventDefault(); // don't submit the form
      if (!editing) return; // bail if user canceled
      value = _editBox.value;
      editing = false;
    }

    void maybeCancel(KeyboardEvent e) {
      if (e.keyCode == KeyCode.ESC) {
        editing = false;
      }
    }
  final int hashCode = ++__observe.Observable.$_nextHashCode;
  var $_observers;
  List $_changes;
  }
  
//@ sourceMappingURL=editable_label.html.dart.map