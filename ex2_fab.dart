import 'package:flutter/material.dart';

class Exercise2Page extends StatefulWidget {
  const Exercise2Page({super.key});

  @override
  State<Exercise2Page> createState() => _Exercise2PageState();
}

class _Exercise2PageState extends State<Exercise2Page> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showOptions() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Opções do FAB'),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Opção 1'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 2: FAB Central'),
      ),
      body: Center(
        child: Text('TAB: ${_selectedIndex + 1}', style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showOptions,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: const Icon(Icons.home), onPressed: () => _onItemTapped(0)),
            IconButton(icon: const Icon(Icons.business), onPressed: () => _onItemTapped(1)),
            const SizedBox(width: 40),
            IconButton(icon: const Icon(Icons.school), onPressed: () => _onItemTapped(2)),
            IconButton(icon: const Icon(Icons.settings), onPressed: () => _onItemTapped(3)),
          ],
        ),
      ),
    );
  }
}