import 'package:flutter/material.dart';
import 'package:projetovazio/screens/components/Lista.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Container(
            child: const Column(
          children: [Lista(), Card()],
        )),
        appBar: AppBar(
          title: const Text("John Rock BB"),
          backgroundColor: const Color(0xFFFF6E40),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => (),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// class Lista extends StatelessWidget {
//   const Lista({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(children: [
//       Card(
//         child: ListTile(
//           leading: Icon(Icons.music_note),
//           title: Text("Alceu Valença e Zezin"),
//           tileColor: Color.fromARGB(255, 231, 30, 30),
//           subtitle: Text("Cantam: Coração Bobo"),
//         ),
//       ),
//       Card(
//         child: ListTile(
//           leading: Icon(Icons.music_note),
//           title: Text("CPM 22"),
//           tileColor: Color.fromARGB(255, 234, 212, 17),
//           subtitle: Text("Canta: Um minuto para o fim do mundo"),
//         ),
//       ),
//       Card(
//         child: ListTile(
//           leading: Icon(Icons.music_note),
//           title: Text("Slipknot"),
//           tileColor: Color.fromARGB(255, 28, 188, 236),
//           subtitle: Text("Canta: Duality"),
//         ),
//       ),
//     ]);
//   }
// }
