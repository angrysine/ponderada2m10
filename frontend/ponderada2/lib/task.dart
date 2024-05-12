import "package:flutter/material.dart";
import "package:ponderada2/login.dart";
import "package:ponderada2/signup.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ponderada 2",
      home: const TaskMainPage(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskMainPage extends StatefulWidget {
  const TaskMainPage({super.key});

  @override
  State<TaskMainPage> createState() => TaskMainPageState();
}

class TaskMainPageState extends State<TaskMainPage> {
  int currentPage = 0;
  List<Widget> pages = const [FormSignUp(), FormLogin()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ponderada 2"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Botão pressionado");
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: "Adicionar Tarefa"),
          NavigationDestination(icon: Icon(Icons.account_box), label: "Tarefas"),
        ],
        selectedIndex: currentPage,
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      body: pages[currentPage],
    );
  }
}
