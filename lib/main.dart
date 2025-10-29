import 'package:flutter/material.dart';

void main() {
  runApp(const ShrinkSquareApp());
}

class ShrinkSquareApp extends StatelessWidget {
  const ShrinkSquareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Square Shrink',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SquareShrinkPage(),
    );
  }
}

class SquareShrinkPage extends StatefulWidget {
  const SquareShrinkPage({super.key});

  @override
  State<SquareShrinkPage> createState() => _SquareShrinkPageState();
}

class _SquareShrinkPageState extends State<SquareShrinkPage> {
  double _size = 200;
  bool _isShrinking = false;

  void _toggleShrink() {
    setState(() {
      _isShrinking = !_isShrinking;
      _size = _isShrinking ? 100 : 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Square Shrink'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _size,
          height: _size,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleShrink,
        label: Text(_isShrinking ? 'Expand' : 'Shrink'),
        icon: const Icon(Icons.aspect_ratio),
      ),
    );
  }
}
