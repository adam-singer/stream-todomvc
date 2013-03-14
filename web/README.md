TodoMVC sample application written with Web UI.

You can see this application [running live](http://dart-lang.github.com/web-ui/example/todomvc/index.html),
or build it and run it yourself as follows:

```bash
# from the top of the dart-web-components package
pub install
./build.dart
dartium --allow-file-access-from-files \
  --enable-experimental-webkit-features \
  --enable-devtools-experiments
  example/todomvc/out/main.html
```

You can also compile the generated code with [dart2js][] and run it in any
of the [modern browsers][browsers] supported by Dart:

    dart2js example/todomvc/out/main.html_bootstrap.dart -oexample/todomvc/out/main.html_bootstrap.dart.js
  
Note that [TodoMVC][] uses CSS features that are not supported yet in all of our
target browsers. If you try running the examples on that site you'll see similar
problems with other frameworks. This causes some things to render incorrectly in
Firefox, IE9 and Opera, such as checkboxes. We'd like to fix the stylesheet so
it renders the same everywhere, but we haven't done it yet.

There are many other ways to run and play with this example. For instance, using
the Dart Editor or using a special extension in [Dartium][]. Check out the Dart
web components [instructions on tools][tools] for more details.

[tools]: http://www.dartlang.org/articles/dart-web-components/tools.html
[Dartium]: http://www.dartlang.org/dartium/
[dart2js]: http://www.dartlang.org/docs/dart2js/
[browsers]: http://www.dartlang.org/support/faq.html#what-browsers-supported
[TodoMVC]: http://addyosmani.github.com/todomvc/
