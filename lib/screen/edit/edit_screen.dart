import 'package:flutter/material.dart';
import 'package:quotes/model/factory.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    MaptoModel data = ModalRoute.of(context)!.settings.arguments as MaptoModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("edit"),
      ),
      body: Column(
        children: [

          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
