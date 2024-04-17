import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'model.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store _store;

  /// A Box of notes.
  late final Box<Person> _PersonBox;

  ObjectBox._create(this._store) {
    _PersonBox = Box<Person>(_store);

    // Add some demo data if the box is empty.
    if (_PersonBox.isEmpty()) {
      // _putDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Note: setting a unique directory is recommended if running on desktop
    // platforms. If none is specified, the default directory is created in the
    // users documents directory, which will not be unique between apps.
    // On mobile this is typically fine, as each app has its own directory
    // structure.

    // Note: set macosApplicationGroup for sandboxed macOS applications, see the
    // info boxes at https://docs.objectbox.io/getting-started for details.

    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"), macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  void addNewPerson(Person model) {
    _PersonBox.put(model);
  }
  List<Person> getAllPersons()
  {
    final query = _PersonBox.query().build();
    final people = query.find();
    return people;
  }
}
