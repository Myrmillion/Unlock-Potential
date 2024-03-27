import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:unlock_potential/utils.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  static final Battery battery = Battery();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Battery'),
        automaticallyImplyLeading: true,
      ),
      // Body
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder(
                        future: battery.batteryLevel,
                        builder: (_, snapshot) => Utils.futureBuilding(
                          snap: snapshot,
                          builder: (level) => Column(
                            children: [
                              Text(
                                "Battery level",
                                style: textTheme.displayMedium,
                              ),
                              Text(
                                "$level%",
                                style: textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: battery.isInBatterySaveMode,
                        builder: (_, snapshot) => Utils.futureBuilding(
                          snap: snapshot,
                          builder: (isSaving) => Column(
                            children: [
                              Text(
                                "Save mode",
                                style: textTheme.displayMedium,
                              ),
                              Text(
                                isSaving ? 'Enabled' : 'Disabled',
                                style: textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0.5,
                  right: 8.0,
                  child: FloatingActionButton(
                    onPressed: () => setState(() {}),
                    child: const Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            flex: 2,
            child: Center(
              child: StreamBuilder(
                stream: battery.onBatteryStateChanged,
                builder: (_, snapshot) => Utils.streamBuilding(
                  snap: snapshot,
                  builder: (state) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Battery status", style: textTheme.displayMedium),
                      Text(state.name, style: textTheme.headlineMedium)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
