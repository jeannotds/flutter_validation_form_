import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class CreatePlanning extends StatefulWidget {
  const CreatePlanning({super.key});

  @override
  State<CreatePlanning> createState() => _CreatePlanningState();
}

class _CreatePlanningState extends State<CreatePlanning> {
  //Creating key for controllin the form
  final _formKey = GlobalKey<FormState>();

  //1. Use controller for get data of Text fields
  final confNameController = TextEditingController();
  final confFirstNameController = TextEditingController();

  String selectedConfType = 'talk';
  DateTime selectedDate = DateTime.now();

  @override

  //2. Dispose controller for get data
  void dispose() {
    super.dispose();
    confFirstNameController.dispose();
    confFirstNameController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Nom',
                          hintText: 'Entrer le nom de l utilisateur',
                          border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: confNameController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'prenom',
                          hintText: 'Entrer le prenom de l utilisateur',
                          border: OutlineInputBorder()),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: confFirstNameController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'talk',
                            child: Text("talk show"),
                          ),
                          DropdownMenuItem(
                            value: 'demo',
                            child: Text("demo code"),
                          ),
                          DropdownMenuItem(
                            value: 'partner',
                            child: Text("partners"),
                          ),
                        ],
                        value: selectedConfType,
                        onChanged: (value) {
                          setState(() {
                            selectedConfType = value!;
                          });
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: DateTimeFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'date',
                            label: Text('Entrer la date')),
                        initialPickerDateTime:
                            DateTime.now().add(const Duration(days: 20)),
                        validator: (e) =>
                            (e?.day ?? 0) == 1 ? "Please select a day" : null,
                        onChanged: (DateTime? value) {
                          setState(() {
                            selectedDate = value!;
                          });
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // get data form
                          final confName = confNameController.text;
                          final confFistName = confFirstNameController.text;

                          //Afficher un message à l ecran lors de l envois du formulaire.
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Envois en cours")));

                          //Disparaitre le clavier apres l envois du formulaire.
                          FocusScope.of(context).requestFocus(FocusNode());

                          // show data
                          print("Name : ${confName}");
                          print("FirstName : ${confFistName}");
                          print("selectedConfType : ${selectedConfType}");
                          print("selectedDate : ${selectedDate}");
                        }
                      },
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      child: const Text('Envoyer'),
                    ),
                  )
                ],
              ))),
    ));
  }
}
