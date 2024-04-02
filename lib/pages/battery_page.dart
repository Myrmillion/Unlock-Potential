import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:unlock_potential/utils/utils.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  static final Battery battery = Battery();

  @override
  Widget build(BuildContext context) {
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
                          builder: (level) => TitleValueWidget(
                            title: "Battery level",
                            value: "$level%",
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: battery.isInBatterySaveMode,
                        builder: (_, snapshot) => Utils.futureBuilding(
                          snap: snapshot,
                          builder: (isSaving) => TitleValueWidget(
                            title: "Save mode",
                            value: isSaving ? 'Enabled' : 'Disabled',
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
                    onPressed: () => setState(() {}), // Refresh
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
                  builder: (state) => TitleValueWidget(
                    title: "Battery status",
                    value: state.name,
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
