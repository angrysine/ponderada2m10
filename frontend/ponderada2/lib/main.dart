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
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [FormSignUp(), FormLogin()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ponderada 2"),
        backgroundColor: Colors.lightBlue,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint("Botão pressionado");
      //   },
      //   backgroundColor: Colors.lightBlue,
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: "Criar usuário"),
          NavigationDestination(icon: Icon(Icons.account_box), label: "Login"),
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
