import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:unlock_potential/utils/utils.dart';
import 'package:unlock_potential/widgets/intrisic_responsive.dart';
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
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: IntrinsicResponsive(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FutureBuilder(
                        future: battery.batteryLevel,
                        builder: (_, snapshot) => Utils.futureBuilding(
                          snap: snapshot,
                          builder: (level) => TitleValue(
                            title: "Battery level",
                            value: "$level%",
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: battery.isInBatterySaveMode,
                        builder: (_, snapshot) => Utils.futureBuilding(
                          snap: snapshot,
                          builder: (isSaving) => TitleValue(
                            title: "Save mode",
                            value: isSaving ? 'Enabled' : 'Disabled',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 8.0,
                    child: FloatingActionButton(
                      heroTag: 'batteryPage-btnRefresh',
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
                    builder: (state) => TitleValue(
                      title: "Battery status",
                      value: state.name,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
