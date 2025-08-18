import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'pages/tasks/tasks.dart';

void main () {
  runApp(const InicialRoute());
}

class InicialRoute extends StatelessWidget {
  const InicialRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do App",
      theme: ThemeData(
        primaryColor: const Color(0xFF4CAF50),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF50),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF2196F3),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF212121)),
          bodyMedium: TextStyle(color: Color(0xFF757575)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Adicione suas telas aqui
  static final List<Widget> _pages = <Widget>[
    HomeApp(key: Key('HomeApp')), // Tela Principal
    TasksPage(key: Key('TasksPage')), // Tela de Tarefas
    Center(child: Text('Tela de Configuração', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: _pages[_selectedIndex], // Troca a tela conforme o índice
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Principal"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tarefas"), // Alterado de "Tasks" para "Tarefas"
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Configuração"),// Alterado de "Settings" para "Configuração"
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF4CAF50),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}