import 'package:flutter/material.dart';

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

  //Dispose controller for get data

  void dispose() {
    super.dispose();
    confFirstNameController.dispose();
    confFirstNameController.dispose();
  }

  @override
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
