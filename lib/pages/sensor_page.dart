import 'package:flutter/material.dart';
import 'package:unlock_potential/widgets/tabs/accelerometer_tab.dart';
import 'package:unlock_potential/widgets/tabs/gyroscope_tab.dart';
import 'package:unlock_potential/widgets/tabs/magnetometer_tab.dart';

class SensorsPage extends StatelessWidget {
  const SensorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // AppBar
        appBar: AppBar(
          title: const Text('Sensors'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Accelerometer', icon: Icon(Icons.directions_run)),
              Tab(text: 'Gyroscope', icon: Icon(Icons.threesixty)),
              Tab(text: 'Magnetometer', icon: Icon(Icons.explore)),
            ],
          ),
          automaticallyImplyLeading: true,
        ),
        // Body
        body: const TabBarView(
          children: [AccelerometerTab(), GyroscopeTab(), MagnetometerTab()],
        ),
      ),
    );
  }
}
