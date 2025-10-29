import 'package:flutter/material.dart';

class Task {
  String title;
  bool isCompleted;
  Task({required this.title, this.isCompleted = false});
}

class Exercise3Page extends StatefulWidget {
  const Exercise3Page({super.key});

  @override
  _Exercise3PageState createState() => _Exercise3PageState();
}

class _Exercise3PageState extends State<Exercise3Page> {
  final List<Task> _tasks = List.generate(5,
    (i) => Task(title: 'Task 2022-07-09 18:08:3${i+1}'));

  int get _uncompletedTasks => _tasks.where((t) => !t.isCompleted).length;

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informação'),
          content: const Text('Você está no App de Notas de Tarefas'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 3: Lista de Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('View Completed Tasks')),
            const SizedBox(height: 16),
            Text('You have $_uncompletedTasks uncompleted tasks'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    color: Colors.yellow[100],
                    child: ListTile(
                      title: Text(task.title),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (val) => setState(() => task.isCompleted = val!),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInfoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}