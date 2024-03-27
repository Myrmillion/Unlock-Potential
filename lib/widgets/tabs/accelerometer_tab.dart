import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';

class AccelerometerTab extends StatefulWidget {
  const AccelerometerTab({super.key});

  @override
  State<AccelerometerTab> createState() => _AccelerometerTabState();
}

class _AccelerometerTabState extends State<AccelerometerTab> {
  final raw = accelerometerEventStream().map((e) => [e.x, e.y, e.z]);
  final user = userAccelerometerEventStream().map((e) => [e.x, e.y, e.z]);

  late bool useRaw = true;

  Widget buildSwitch() {
    return Positioned(
      top: 8.0,
      right: 8.0,
      child: Row(
        children: [
          const Tooltip(
            message: "Raw = Data right out of the sensor.\n"
                "User = Data after filtering out gravity.",
            triggerMode: TooltipTriggerMode.tap,
            showDuration: Duration(seconds: 5),
            child: Icon(Icons.info_outline),
          ),
          const SizedBox(width: 8.0),
          OutlinedButton(
            onPressed: () => setState(() => useRaw = !useRaw),
            child: Text("Show ${useRaw ? "user" : "raw"} data"),
          ),
        ],
      ),
    );
  }

  Widget buildData(List<double> data) {
    final textTheme = Theme.of(context).textTheme;
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          Text("X", style: textTheme.displayMedium),
          Text("${data[0]}", style: textTheme.headlineMedium),
          const Spacer(),
          Text("Y", style: textTheme.displayMedium),
          Text("${data[1]}", style: textTheme.headlineMedium),
          const Spacer(),
          Text("Z", style: textTheme.displayMedium),
          Text("${data[2]}", style: textTheme.headlineMedium),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: useRaw ? raw : user,
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (acc) => Stack(children: [buildSwitch(), buildData(acc)]),
      ),
    );
  }
}
