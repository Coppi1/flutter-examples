import 'package:exercicio_aula8b/Models/Animal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animals',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Aimals List'),
            backgroundColor: Colors.limeAccent,
          ), // AppBar
          body: const Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Animal('Tip', Colors.red),
              SizedBox(height: 8.0),
              Animal('Mimi', Colors.grey),
              SizedBox(height: 8.0),
              Animal('Bruce', Colors.yellowAccent),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image(image: AssetImage("images/dog.png")),
              )
            ]),
          ),
        ));
  }
}
