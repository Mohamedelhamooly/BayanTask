import 'package:flutter/material.dart';
import 'package:objectbox_demo/main.dart';
import 'package:objectbox_demo/model.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nationalityIDController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextField(controller: nameController, keyboardType: TextInputType.text),
          TextField(controller: ageController, keyboardType: TextInputType.text,),
          TextField(controller: nationalityIDController, keyboardType: TextInputType.number,),
          TextField(controller: birthDateController, keyboardType: TextInputType.datetime,),
          InkWell(
            onTap: (){
              var person = Person();
              person.age = double.parse(ageController.text);
              person.name = nameController.text;
              person.birthDate = birthDateController.text;
              person.nationalityID = int.parse(nationalityIDController.text);
              objectbox.addNewPerson(person);
            },
            child: Text("Add new Person"),
          )
        ],
      ),
    );
  }
}
