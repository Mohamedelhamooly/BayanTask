import 'dart:async';

import 'package:flutter/material.dart';
import 'package:objectbox_demo/addForm.dart';

import 'model.dart';
import 'objectbox.dart';
import 'routes/app_routes.dart';

// ignore_for_file: public_member_api_docs

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'OB Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(title: 'OB Example'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _noteInputController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AllPersonList(),
        floatingActionButton: FloatingActionButton(
          key: const Key('Add new person'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddForm()),
            );
          },
          child: const Icon(Icons.add),
        ),
      );
}

class AllPersonList extends StatefulWidget {
  const AllPersonList({super.key});

  @override
  State<AllPersonList> createState() => _AllPersonListState();
}

class _AllPersonListState extends State<AllPersonList> {
  @override
  Widget build(BuildContext context) {
    List<Person> listPersons = objectbox.getAllPersons();
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
            listPersons.length,
            (index) => Column(
                  children: [
                    Text(listPersons[index].name ?? ""),
                    Text("${listPersons[index].age}"),
                    Text("${listPersons[index].nationalityID}"),
                    Text(listPersons[index].birthDate ?? "")
                  ],
                )));
  }
}

