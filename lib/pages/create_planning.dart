import 'package:flutter/material.dart';

class CreatePlanning extends StatefulWidget {
  const CreatePlanning({super.key});

  @override
  State<CreatePlanning> createState() => _CreatePlanningState();
}

class _CreatePlanningState extends State<CreatePlanning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom',
                      hintText: 'Entrer le nom de l utilisateur',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child: const Text('Envoyer'),
                ),
              )
            ],
          ))),
    ));
  }
}
