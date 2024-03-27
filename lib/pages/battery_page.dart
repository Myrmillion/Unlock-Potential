import 'package:flutter/material.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text(
          'This is the Battery Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
