import 'package:flutter/material.dart';

class addProductPage extends StatefulWidget {
  const addProductPage({super.key});

  @override
  State<addProductPage> createState() => _addProductPageState();
}

class _addProductPageState extends State<addProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление товара"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Hello')
            ),
          ],
        ),
      ),
    );
  }
}
