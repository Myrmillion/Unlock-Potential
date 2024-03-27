import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';

class MagnetometerTab extends StatelessWidget {
  const MagnetometerTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return StreamBuilder(
      stream: magnetometerEventStream(),
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (magnetometer) => Column(
          children: [
            const Spacer(),
            Text("X", style: textTheme.displayMedium),
            Text("${magnetometer.x}", style: textTheme.headlineMedium),
            const Spacer(),
            Text("Y", style: textTheme.displayMedium),
            Text("${magnetometer.y}", style: textTheme.headlineMedium),
            const Spacer(),
            Text("Z", style: textTheme.displayMedium),
            Text("${magnetometer.z}", style: textTheme.headlineMedium),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
