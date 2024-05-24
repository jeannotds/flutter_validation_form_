import 'package:flutter/material.dart';

class CreatePlanning extends StatefulWidget {
  const CreatePlanning({super.key});

  @override
  State<CreatePlanning> createState() => _CreatePlanningState();
}

class _CreatePlanningState extends State<CreatePlanning> {
  final _formKey = GlobalKey<FormState>();

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
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //Afficher un message à l ecran lors de l envois du formulaire.
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Envois en cours")));

                          //Disparaitre le clavier apres l envois du formulaire.
                          FocusScope.of(context).requestFocus(FocusNode());
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
