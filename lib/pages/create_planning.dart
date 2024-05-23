import 'package:flutter/material.dart';

class CreatePlanning extends StatefulWidget {
  const CreatePlanning({super.key});

  @override
  State<CreatePlanning> createState() => _CreatePlanningState();
}

class _CreatePlanningState extends State<CreatePlanning> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Formulaire"),
    ));
  }
}
