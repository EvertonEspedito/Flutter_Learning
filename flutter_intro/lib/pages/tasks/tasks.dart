import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(text);
        _controller.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas',),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
                children: [
                Expanded(
                  child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Adicionar nova tarefa',
                  ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.blue.shade100, // Altere a cor conforme desejado
                  shape: BoxShape.circle,
                  ),
                  child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: _addTask,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.check_circle, color: Colors.green),
                        onPressed: () {
                          // Aqui você pode adicionar lógica para marcar a tarefa como concluída
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tarefa "${_tasks[index]}" concluída!')),
                          );
                          _removeTask(index);
                        },
                      ),
                      leading: IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onPressed: () { 
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tarefa "${_tasks[index]}" Removida!')),
                          );
                          _removeTask(index);;
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}