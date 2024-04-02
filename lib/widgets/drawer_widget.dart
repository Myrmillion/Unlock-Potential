import 'package:flutter/material.dart';
import 'package:unlock_potential/utils/utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Important: No padding from ListView.
              children: [
                DrawerHeader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/logo.png", height: 72.0),
                      const Spacer(flex: 2),
                      Text(
                        'Unlock Potential',
                        style: textTheme.titleLarge?.copyWith(fontSize: 25.0),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.device_unknown),
                  title: const Text('Device'),
                  onTap: () => Navigator.popAndPushNamed(context, '/device'),
                ),
                ListTile(
                  leading: const Icon(Icons.sensors),
                  title: const Text('Sensors'),
                  onTap: () => Navigator.popAndPushNamed(context, '/sensors'),
                ),
                ListTile(
                  leading: const Icon(Icons.battery_unknown),
                  title: const Text('Battery'),
                  onTap: () => Navigator.popAndPushNamed(context, '/battery'),
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () => Navigator.popAndPushNamed(context, '/about'),
                ),
              ),
              Placeholder(
                color: Colors.red.shade800,
                strokeWidth: 3.0,
                child: IconButton(
                  icon: const Icon(Icons.lightbulb),
                  onPressed: () => Utils.simpleSnackBar(
                      context, 'Work in progress, come back later... !'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7.5),
        ],
      ),
    );
  }
}
