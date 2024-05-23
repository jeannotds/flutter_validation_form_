import 'package:flutter/material.dart';
import 'package:formulaire/pages/create_planning.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreatePlanning()));
                },
                child: const Text('Gets us'))),
      ),
    );
  }
}
